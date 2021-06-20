# frozen_string_literal: true

FactoryBot.define do
  factory :exists, class: 'Esquery::Exists' do
    initialize_with { new(field) }

    field { 'field_name' }
  end
end
