# frozen_string_literal: true

RSpec.describe Esquery::Occurrence do
  describe 'initialize' do
    subject(:init) { build(:occurrence, type: type) }

    context 'when valid type' do
      let(:type) { :filter }

      it { is_expected.to be_instance_of(described_class) }
    end

    context 'when invalid type' do
      let(:type) { :hoge }

      it { expect { init }.to raise_error(ArgumentError) }
    end
  end

  describe '#terms' do
    subject(:result) { build(:occurrence).terms(:field_name, %w[hello]) }

    let(:hash) do
      {
        bool: {
          filter: [
            { terms: { field_name: %w[hello] } }
          ]
        }
      }
    end

    it { expect(result.to_h).to eq hash }
  end

  describe '#match' do
    subject(:result) { build(:occurrence, :must).match(:field_name, 'hello') }

    let(:hash) do
      {
        bool: {
          must: [
            { match: { field_name: { query: 'hello' } } }
          ]
        }
      }
    end

    it { expect(result.to_h).to eq hash }
  end

  describe '#range' do
    subject(:result) { build(:occurrence).range(:field_name, lt: 1) }

    let(:hash) do
      {
        bool: {
          filter: [
            { range: { field_name: { lt: 1 } } }
          ]
        }
      }
    end

    it { expect(result.to_h).to eq hash }
  end

  describe '#exists' do
    subject(:result) { build(:occurrence, :must).exists('field_name') }

    let(:hash) do
      {
        bool: {
          must: [
            { exists: { field: 'field_name' } }
          ]
        }
      }
    end

    it { expect(result.to_h).to eq hash }
  end

  describe '#geo_polygon' do
    subject(:result) { build(:occurrence).geo_polygon(:field_name, [{ lat: 10, lon: 20 }]) }

    let(:hash) do
      {
        bool: {
          filter: [
            { geo_polygon: { field_name: { points: [{ lat: 10, lon: 20 }] } } }
          ]
        }
      }
    end

    it { expect(result.to_h).to eq hash }
  end

  describe '#bool' do
    subject(:result) do
      build(:occurrence).bool do
        filter.term(:field_name, 'hello')
      end
    end

    let(:hash) do
      {
        bool: {
          filter: [
            {
              bool: {
                filter: [
                  { term: { field_name: 'hello' } }
                ]
              }
            }
          ]
        }
      }
    end

    it { expect(result.to_h).to eq hash }
  end

  describe '#nested' do
    subject(:result) do
      build(:occurrence).nested(:nested_path) do
        filter do
          term(:field_name, 'hello')
        end
      end
    end

    let(:hash) do
      {
        bool: {
          filter: [
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
          ]
        }
      }
    end

    it { expect(result.to_h).to eq hash }
  end
end
