# frozen_string_literal: true

class GeocoderService
  def initialize(start_address, destination_address)
    @start_address = start_address
    @destination_address = destination_address
  end

  def calculate_trip
    Geocoder::Calculations.distance_between(
      @start_address, @destination_address, units: :km
    )
  end

  def calculate_trip_result
    calculate_trip unless calculate_trip.nan?
  end
end
