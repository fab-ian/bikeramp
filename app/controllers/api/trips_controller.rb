# frozen_string_literal: true

module Api
  class TripsController < ApplicationController
    def create
      trip = TripService.call(trip_params)

      if trip.save
        render json: trip, status: :created
      else
        render json: trip.errors, status: :unprocessable_entity
      end
    end

    private

    def trip_params
      params.require(:trip).permit(:start_address, :destination_address, :price, :date)
    end
  end
end
