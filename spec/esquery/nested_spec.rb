# frozen_string_literal: true

RSpec.describe Esquery::Nested do
  describe '#to_h' do
    subject { build(:nested).to_h }

    let(:hash) do
      {
        nested: {
          path: :nested_path,
          query: {
            bool: {
              filter: [
                { term: { field_name: 'hello' } }
              ]
            }
          }
        }
      }
    end

    it { is_expected.to eq(hash) }
  end
end
