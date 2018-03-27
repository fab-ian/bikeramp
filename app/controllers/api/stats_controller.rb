# frozen_string_literal: true

module Api
  class StatsController < ApplicationController
    def weekly
      stat =
        Trip.where(date: Date.today.beginning_of_week..Date.today.end_of_week)
            .pluck('sum(distance)', 'sum(price)')
            .first

      render json: { total_distance: Formater.km_format(stat.first), total_price: Formater.price_format(stat.second) }
    end

    def monthly
      render json: Stats.monthly
    end
  end
end
