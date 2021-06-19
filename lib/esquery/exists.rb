# frozen_string_literal: true

module Esquery
  # Esquery::Exists
  class Exists
    def initialize(field)
      @field = field
    end

    def to_h
      {
        exists: {
          field: field
        }
      }
    end

    private

    attr_reader :field
  end
end
