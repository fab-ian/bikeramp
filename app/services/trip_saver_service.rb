# frozen_string_literal: true

class TripSaverService
  def call(trip_params)
    @trip_params = trip_params
    distance = calculate_trip

    if distance.nan?
      { type: 'geocoder_error', message: 'Please check start and destination address', status: 422 }
    else
      save_record(distance)
    end
  end

  def calculate_trip
    Geocoder::Calculations.distance_between(
      @trip_params[:start_address], @trip_params[:destination_address], units: :km
    )
  end

  def save_record(distance)
    @trip_params[:distance] = distance
    trip = Trip.new(@trip_params)

    if trip.valid?
      trip.save
      { type: 'info', message: 'Trip has been successfully created', status: 201 }
    else
      { type: 'validation_error', message: trip.errors.messages, status: 422 }
    end
  end
end
