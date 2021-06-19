# frozen_string_literal: true

module Esquery
  # Esquery::Match
  class Match
    def initialize(field, value)
      @field = field
      @value = value
    end

    def to_h
      {
        match: {
          field => {
            query: value
          }
        }
      }
    end

    private

    attr_reader :field, :value
  end
end
