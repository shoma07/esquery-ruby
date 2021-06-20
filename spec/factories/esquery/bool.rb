# frozen_string_literal: true

FactoryBot.define do
  factory :bool, class: 'Esquery::Bool' do
    initialize_with do
      new(
        must: must,
        must_not: must_not,
        should: should,
        filter: filter
      )
    end

    must { [] }
    must_not { [] }
    should { [] }
    filter { [] }

    trait :filter do
      filter { [{ term: { field_name: 'hello' } }] }
    end
  end
end
