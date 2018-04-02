# frozen_string_literal: true

class TripService
  def self.call(trip_params)
    distance = GeocoderService.new(
      trip_params[:start_address], trip_params[:destination_address]
    ).calculate_trip_result

    trip_params[:distance] = distance

    Trip.new(trip_params)
  end
end
