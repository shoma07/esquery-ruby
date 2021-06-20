# frozen_string_literal: true

RSpec.describe Esquery::GeoPolygon do
  describe '#to_h' do
    subject { build(:geo_polygon).to_h }

    let(:hash) do
      {
        geo_polygon: {
          field_name: {
            points: [
              { lat: 10, lon: 20 }
            ]
          }
        }
      }
    end

    it { is_expected.to eq(hash) }
  end
end
