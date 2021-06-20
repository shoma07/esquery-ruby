# frozen_string_literal: true

FactoryBot.define do
  factory :occurrence, class: 'Esquery::Occurrence' do
    initialize_with do
      new(
        type,
        query,
        nested_path: nested_path,
        chain: chain
      )
    end

    filter
    query { build(:bool) }
    nested_path { nil }
    chain { false }

    trait :must do
      type { :must }
    end

    trait :must_not do
      type { :must_not }
    end

    trait :should do
      type { :should }
    end

    trait :filter do
      type { :filter }
    end

    trait :chain do
      chain { true }
    end
  end
end
