# frozen_string_literal: true

module Esquery
  # Esquery::Occurrence
  class Occurrence
    TYPES = %i[must must_not should filter].freeze
    private_constant :TYPES

    attr_reader :query

    def initialize(type, query = BoolQuery.new, nested_path: nil, chain: false)
      @type = TYPES.include?(type) ? type : (raise ArgumentError, type)
      @query = query
      @nested_path = nested_path
      @chain = chain
    end

    def term(field, value)
      build(Term.new(field, value))
    end

    def terms(field, value)
      build(Terms.new(field, value))
    end

    def match(field, value)
      build(Match.new(field, value))
    end

    def range(field, **keywords)
      build(Range.new(field, **keywords))
    end

    def exists(field)
      build(Exists.new(field))
    end

    def geo_polygon(field, points)
      build(GeoPolygon.new(field, points))
    end

    def bool(&block)
      build(BoolQuery.new.block_call(&block))
    end

    def nested(path)
      self.class.new(type, query, nested_path: path)
    end

    def block_call(&block)
      return self if block.nil?
      return instance_exec(&block) if chain

      self.class.new(type, query, nested_path: nested_path, chain: true).block_call(&block).query
    end

    private

    attr_reader :type, :nested_path, :chain

    def build(add_query)
      bool_query = query + BoolQuery.new(
        type => [
          nested_path.nil? ? add_query : Nested.new(nested_path, add_query)
        ]
      )
      chain ? Occurrence.new(type, bool_query, nested_path: nested_path, chain: chain) : bool_query
    end
  end
end
