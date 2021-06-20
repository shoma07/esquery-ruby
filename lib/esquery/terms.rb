# frozen_string_literal: true

module Esquery
  # Esquery::Terms
  class Terms
    def initialize(field, value)
      @field = field
      @value = value
    end

    def to_h
      { terms: { field => value } }
    end

    private

    attr_reader :field, :value
  end
end
