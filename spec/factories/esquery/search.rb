# frozen_string_literal: true

FactoryBot.define do
  factory :search, class: 'Esquery::Search' do
    initialize_with do
      new(
        from: from,
        size: size,
        sort: sort,
        query: query
      )
    end

    from { 0 }
    size { 10 }
    sort { [] }
    query { build(:bool) }
  end
end
