# frozen_string_literal: true

FactoryBot.define do
  factory :range, class: 'Esquery::Range' do
    initialize_with do
      new(
        field,
        gt: gt,
        gte: gte,
        lt: lt,
        lte: lte,
        relation: relation,
        time_zone: time_zone
      )
    end

    field { :field_name }
    gt { nil }
    gte { nil }
    lt { nil }
    lte { nil }
    relation { nil }
    time_zone { nil }

    trait :gt do
      gt { 1 }
    end

    trait :gte do
      gte { 1 }
    end

    trait :lt do
      lt { 1 }
    end

    trait :lte do
      lte { 1 }
    end
  end
end
