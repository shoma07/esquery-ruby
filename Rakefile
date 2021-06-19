# frozen_string_literal: true

require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

require "rubocop/rake_task"

RuboCop::RakeTask.new

# @see https://github.com/soutaro/steep/blob/master/exe/steep
require 'steep'
require 'steep/cli'
desc 'typecheck'
task :steep do
  Steep::CLI.new(argv: %w[check], stdout: $stdout, stderr: $stderr, stdin: $stdin).run
end

task default: %i[rubocop steep spec]
