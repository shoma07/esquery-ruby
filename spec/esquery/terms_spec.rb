# frozen_string_literal: true

RSpec.describe Esquery::Terms do
  describe '#to_h' do
    subject { build(:terms).to_h }

    let(:hash) do
      {
        terms: {
          field_name: %w[match_value]
        }
      }
    end

    it { is_expected.to eq(hash) }
  end
end
