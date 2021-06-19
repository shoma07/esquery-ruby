# frozen_string_literal: true

require_relative 'esquery/version'
require_relative 'esquery/search'
require_relative 'esquery/exists'
require_relative 'esquery/geo_polygon'
require_relative 'esquery/match'
require_relative 'esquery/nested'
require_relative 'esquery/occurrence'
require_relative 'esquery/range'
require_relative 'esquery/term'
require_relative 'esquery/terms'
require_relative 'esquery/bool_query'

module Esquery
  class Error < StandardError; end
  # Your code goes here...
end
