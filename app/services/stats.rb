# frozen_string_literal: true

class Stats
  class << self
    def monthly
      trip = Trip.find_by_sql [monthly_query, Date.today.beginning_of_month.to_s, Date.today.end_of_month.to_s]
      format_result(trip)
    end

    def monthly_query
      <<-QUERY.gsub(/\s+/, ' ').strip
        SELECT t.date,
        sum(distance) AS total_distance,
        avg(distance) AS avg_ride,
        avg(price) AS avg_price

        FROM trips AS t
        WHERE t.date > ? AND t.date < ?
        GROUP BY t.date ORDER BY t.date
      QUERY
    end

    def format_result(trip_stat)
      [].tap do |result|
        trip_stat.each do |trip|
          result << {
            day: trip.date.to_s(:month_and_day),
            total_distance: Formater.km_format(trip.total_distance),
            avg_ride: Formater.km_format(trip.avg_ride),
            avg_price: Formater.price_format(trip.avg_price)
          }
        end
      end
    end
  end
end
