# frozen_string_literal: true

FactoryBot.define do
  factory :nested, class: 'Esquery::Nested' do
    initialize_with { new(path, query) }

    path { :nested_path }
    query { build(:bool, :filter) }
  end
end
