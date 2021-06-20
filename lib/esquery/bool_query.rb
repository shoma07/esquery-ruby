# frozen_string_literal: true

module Esquery
  # Esquery::BoolQuery
  class BoolQuery
    class << self
      def build(attributes = {}, &block)
        new(
          must: fetch_attribute(attributes, :must),
          must_not: fetch_attribute(attributes, :must_not),
          should: fetch_attribute(attributes, :should),
          filter: fetch_attribute(attributes, :filter)
        ).block_call(&block)
      end

      private

      def fetch_attribute(attributes, key)
        attributes.values_at(key, key.to_s).compact.first.to_a
      end
    end

    def initialize(must: [], must_not: [], should: [], filter: [])
      @must_queries = must
      @must_not_queries = must_not
      @should_queries = should
      @filter_queries = filter
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

    def query
      self
    end

    def to_h
      {
        bool: {
          must: compact_queries_hash(must_queries),
          must_not: compact_queries_hash(must_not_queries),
          should: compact_queries_hash(should_queries),
          filter: compact_queries_hash(filter_queries)
        }.reject { |_k, v| v.empty? }
      }
    end

    protected

    attr_reader :must_queries, :must_not_queries, :should_queries, :filter_queries

    private

    def build_occurrence(occurrence_type, &block)
      Occurrence.new(occurrence_type, self).block_call(&block)
    end

    def compact_queries_hash(queries)
      queries.map(&:to_h).reject(&:empty?)
    end
  end
end
