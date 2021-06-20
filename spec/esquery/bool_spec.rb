# frozen_string_literal: true

RSpec.describe Esquery::Bool do
  let(:bool) { build(:bool) }

  shared_examples 'build occurrence' do
    it { is_expected.to be_instance_of(Esquery::Occurrence) }
    it { is_expected.to have_attributes(query: bool) }
  end

  describe '#must' do
    subject { bool.must }

    it_behaves_like 'build occurrence'
  end

  describe '#must_not' do
    subject { bool.must_not }

    it_behaves_like 'build occurrence'
  end

  describe '#should' do
    subject { bool.should }

    it_behaves_like 'build occurrence'
  end

  describe '#filter' do
    subject { bool.filter }

    it_behaves_like 'build occurrence'
  end

  describe '#query' do
    subject { bool.query }

    it { is_expected.to eq bool }
  end

  describe '#empty?' do
    subject { bool.empty? }

    it { is_expected.to be_truthy }
  end

  shared_examples 'add method' do
    let(:other) { build(:bool, :filter) }
    let(:hash) do
      {
        bool: {
          filter: [
            { term: { field_name: 'hello' } }
          ]
        }
      }
    end

    it 'is match hash' do
      expect(subject.to_h).to eq hash
    end
  end

  describe '#+' do
    subject { bool.+(other) }

    it_behaves_like 'add method'
  end

  describe '#add' do
    subject { bool.add(other) }

    it_behaves_like 'add method'
  end

  describe '#block_call' do
    subject { bool.block_call(&block) }

    context 'when no block' do
      let(:block) { nil }

      it { is_expected.to eq bool }
    end

    context 'when exist block' do
      let(:block) do
        proc { filter }
      end

      it { is_expected.to be_instance_of(Esquery::Occurrence) }
    end
  end

  describe '#to_h' do
    subject do
      build(
        :bool,
        filter: [
          build(:term)
        ]
      ).to_h
    end

    let(:hash) do
      {
        bool: {
          filter: [
            { term: { field_name: 'match_value' } }
          ]
        }
      }
    end

    it { is_expected.to eq hash }
  end

  describe 'self.build' do
    subject(:builded) { described_class.build(attributes, &block) }

    let(:attributes) { {} }
    let(:block) { nil }

    context 'when no argument' do
      it { is_expected.to be_instance_of(described_class) }
    end

    context 'when exists attributes of string key' do
      let(:attributes) { { 'filter' => [build(:term)] } }

      it { is_expected.to be_instance_of(described_class) }

      it 'match hash' do
        expect(builded.to_h).to eq({ bool: { filter: [{ term: { field_name: 'match_value' } }] } })
      end
    end

    context 'when exists attributes of symbol key' do
      let(:attributes) { { filter: [build(:term)] } }

      it { is_expected.to be_instance_of(described_class) }

      it 'match hash' do
        expect(builded.to_h).to eq({ bool: { filter: [{ term: { field_name: 'match_value' } }] } })
      end
    end

    context 'when exists block' do
      let(:block) do
        proc { filter.term(:field_name, 'value') }
      end

      it { is_expected.to be_instance_of(described_class) }

      it 'match hash' do
        expect(builded.to_h).to eq({ bool: { filter: [{ term: { field_name: 'value' } }] } })
      end
    end
  end
end
