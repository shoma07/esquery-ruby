# frozen_string_literal: true

RSpec.describe Esquery::Range do
  describe '#to_h' do
    subject { build(:range, trait).to_h }

    context 'when gt' do
      let(:trait) { :gt }

      let(:hash) do
        {
          range: {
            field_name: {
              gt: 1
            }
          }
        }
      end

      it { is_expected.to eq(hash) }
    end

    context 'when gte' do
      let(:trait) { :gte }

      let(:hash) do
        {
          range: {
            field_name: {
              gte: 1
            }
          }
        }
      end

      it { is_expected.to eq(hash) }
    end

    context 'when lt' do
      let(:trait) { :lt }

      let(:hash) do
        {
          range: {
            field_name: {
              lt: 1
            }
          }
        }
      end

      it { is_expected.to eq(hash) }
    end

    context 'when lte' do
      let(:trait) { :lte }

      let(:hash) do
        {
          range: {
            field_name: {
              lte: 1
            }
          }
        }
      end

      it { is_expected.to eq(hash) }
    end
  end
end
