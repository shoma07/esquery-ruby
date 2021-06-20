# frozen_string_literal: true

RSpec.describe Esquery::Match do
  describe '#to_h' do
    subject { build(:match).to_h }

    let(:hash) do
      {
        match: {
          field_name: {
            query: 'match_value'
          }
        }
      }
    end

    it { is_expected.to eq(hash) }
  end
end
