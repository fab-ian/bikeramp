# frozen_string_literal: true

class TripSaverService
  def call(trip_params)
    distance = GeocoderService.new(
      trip_params[:start_address], trip_params[:destination_address]
    ).calculate_trip_result

    trip_params[:distance] = distance
    save_record(trip_params)
  end

  def save_record(trip_params)
    trip = Trip.new(trip_params)

    if trip.valid?
      trip.save
      { type: 'info', message: 'Trip has been successfully created', status: 201 }
    else
      { type: 'validation_error', message: trip.errors.messages, status: 422 }
    end
  end
end
