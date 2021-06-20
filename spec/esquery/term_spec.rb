# frozen_string_literal: true

RSpec.describe Esquery::Term do
  describe '#to_h' do
    subject { build(:term).to_h }

    let(:hash) do
      {
        term: {
          field_name: 'match_value'
        }
      }
    end

    it { is_expected.to eq(hash) }
  end
end
