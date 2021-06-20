# frozen_string_literal: true

FactoryBot.define do
  factory :term, class: 'Esquery::Term' do
    initialize_with { new(field, value) }

    field { :field_name }
    value { 'match_value' }
  end
end
