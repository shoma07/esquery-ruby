# frozen_string_literal: true

module Esquery
  # Esquery::Range
  class Range
    # rubocop:disable Metrics/ParameterLists, Naming/MethodParameterName
    def initialize(field, gt: nil, gte: nil, lt: nil, lte: nil, relation: nil, time_zone: nil)
      @field = field
      @gt = gt
      @gte = gte
      @lt = lt
      @lte = lte
      @relation = relation
      @time_zone = time_zone
    end
    # rubocop:enable Metrics/ParameterLists, Naming/MethodParameterName

    def to_h
      {
        range: {
          gt: gt,
          gte: gte,
          lt: lt,
          lte: lte,
          relation: relation,
          time_zone: time_zone
        }.compact
      }
    end

    private

    attr_reader :field, :gt, :gte, :lt, :lte, :relation, :time_zone
  end
end
