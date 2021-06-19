# frozen_string_literal: true

module Esquery
  # Esquery::Search
  class Search
    def initialize(from: 0, size: 10, sort: [], query: {})
      @from = from
      @size = size
      @sort = sort
      @query = query
    end

    def page(page)
      update(from: size * (page - 1))
    end

    def update(from: nil, size: nil, sort: nil, query: nil)
      self.class.new(
        from: from || self.from,
        size: size || self.size,
        sort: sort || self.sort,
        query: query || self.query
      )
    end

    def to_h
      {
        from: from,
        size: size,
        sort: sort,
        query: query.to_h
      }
    end

    private

    attr_reader :from, :size, :sort, :query
  end
end
