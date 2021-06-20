# frozen_string_literal: true

RSpec.describe Esquery::Search do
  let(:search) { build(:search) }

  describe '#page' do
    subject { search.page(page).to_h[:from] }

    context 'when page is 1' do
      let(:page) { 1 }

      it { is_expected.to eq 0 }
    end

    context 'when page is 2' do
      let(:page) { 2 }

      it { is_expected.to eq 10 }
    end

    context 'when page is 3' do
      let(:page) { 3 }

      it { is_expected.to eq 20 }
    end
  end

  describe '#update' do
    subject { search.update(**keywords).to_h }

    let(:hash) do
      {
        from: 0,
        size: 10,
        sort: [],
        query: { bool: {} }
      }
    end

    context 'when update from' do
      let(:keywords) { { from: 10 } }

      it { is_expected.to eq hash.merge(from: 10) }
    end

    context 'when update size' do
      let(:keywords) { { size: 100 } }

      it { is_expected.to eq hash.merge(size: 100) }
    end

    context 'when update query' do
      let(:keywords) { { query: updatable_query } }
      let(:updatable_query) { build(:bool, :filter) }

      it { is_expected.to eq hash.merge(query: updatable_query.to_h) }
    end
  end
end
