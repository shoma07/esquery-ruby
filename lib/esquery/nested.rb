# frozen_string_literal: true

module Esquery
  # Esquery::Nested
  class Nested
    def initialize(path, query)
      @path = path
      @query = query
    end

    def to_h
      {
        nested: {
          path: path,
          query: query.to_h
        }
      }
    end

    private

    attr_reader :path, :query
  end
end
