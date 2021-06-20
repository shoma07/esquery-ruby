# frozen_string_literal: true

require 'factory_bot'
require 'simplecov'

SimpleCov.start do
  enable_coverage :branch
  add_filter '/spec/'
end
SimpleCov.minimum_coverage 100

require 'esquery'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.include FactoryBot::Syntax::Methods
  config.before(:suite) do
    FactoryBot.find_definitions
  end
end
