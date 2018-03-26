# frozen_string_literal: true

module Api
  class TripsController < ApplicationController
    def create
      trip = TripSaverService.new.call(trip_params)
      render json: trip, status: trip[:status]
    end

    private

    def trip_params
      params.require(:trip).permit(:start_address, :destination_address, :price, :date)
    end
  end
end
