# frozen_string_literal: true

module Esquery
  # Esquery::BoolQuery
  class BoolQuery
    def initialize(must: [], must_not: [], should: [], filter: [], &block)
      @must_queries = must
      @must_not_queries = must_not
      @should_queries = should
      @filter_queries = filter

      block_call(&block)
    end

    def must(&block)
      build_occurrence(:must, &block)
    end

    def must_not(&block)
      build_occurrence(:must_not, &block)
    end

    def should(&block)
      build_occurrence(:should, &block)
    end

    def filter(&block)
      build_occurrence(:filter, &block)
    end

    def empty?
      [must_queries, must_not_queries, should_queries, filter_queries].all?(&:empty?)
    end

    def +(other)
      self.class.new(
        must: must_queries + other.must_queries,
        must_not: must_not_queries + other.must_not_queries,
        should: should_queries + other.should_queries,
        filter: filter_queries + other.filter_queries
      )
    end

    def block_call(&block)
      block.nil? ? self : instance_exec(&block)
    end

    def to_h
      {
        bool: {
          must: must_queries.map(&:to_h),
          must_not: must_not_queries.map(&:to_h),
          should: should_queries.map(&:to_h),
          filter: filter_queries.map(&:to_h)
        }.reject { |_k, v| v.empty? }
      }
    end

    protected

    attr_reader :must_queries, :must_not_queries, :should_queries, :filter_queries

    def build_occurrence(occurrence_type, &block)
      Occurrence.new(occurrence_type, self).block_call(&block)
    end
  end
end
