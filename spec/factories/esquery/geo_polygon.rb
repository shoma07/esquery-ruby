# frozen_string_literal: true

FactoryBot.define do
  factory :geo_polygon, class: 'Esquery::GeoPolygon' do
    initialize_with { new(field, points) }

    field { :field_name }
    points { [{ lat: 10, lon: 20 }] }
  end
end
