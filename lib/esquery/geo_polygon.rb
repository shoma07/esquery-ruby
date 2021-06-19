# frozen_string_literal: true

module Esquery
  # Esquery::GeoPolygon
  class GeoPolygon
    def initialize(field, points)
      @field = field
      @points = points
    end

    def to_h
      {
        geo_polygon: {
          field => {
            points: points
          }
        }
      }
    end

    private

    attr_reader :field, :points
  end
end
