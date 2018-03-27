# frozen_string_literal: true

class Stats
  def self.monthly
    trip = Trip.find_by_sql [monthly_query, Date.today.beginning_of_week.to_s, Date.today.end_of_week.to_s]
    format_result(trip)
  end

  def self.monthly_query
    <<-QUERY.gsub(/\s+/, ' ').strip
      SELECT t.date,
      (SELECT sum(v.distance) FROM trips AS v WHERE date = t.date) AS total_distance,
      (SELECT avg(v.distance) FROM trips AS v WHERE date = t.date) AS avg_ride,
      (SELECT avg(v.price) FROM trips AS v WHERE date = t.date) AS avg_price

      FROM trips AS t
      WHERE t.date > ? AND t.date < ?
      GROUP BY t.date ORDER BY t.date
    QUERY
  end

  def self.format_result(trip_stat)
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
