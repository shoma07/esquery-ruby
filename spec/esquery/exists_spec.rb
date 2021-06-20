# frozen_string_literal: true

RSpec.describe Esquery::Exists do
  describe '#to_h' do
    subject { build(:exists).to_h }

    let(:hash) do
      {
        exists: {
          field: 'field_name'
        }
      }
    end

    it { is_expected.to eq(hash) }
  end
end
