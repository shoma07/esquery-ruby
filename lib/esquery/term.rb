# frozen_string_literal: true

module Esquery
  # Esquery::Term
  class Term
    def initialize(field, value)
      @field = field
      @value = value
    end

    def to_h
      { term: { field => value } }
    end

    private

    attr_reader :field, :value
  end
end
