# frozen_string_literal: true

FactoryBot.define do
  factory :terms, class: 'Esquery::Terms' do
    initialize_with { new(field, value) }

    field { :field_name }
    value { %w[match_value] }
  end
end
