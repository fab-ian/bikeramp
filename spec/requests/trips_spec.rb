# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Trip, types: :request do
  let(:trip_without_distance) { attributes_for(:trip, distance: nil) }

  describe 'GET /api/trips' do
    before { post '/api/trips', params: { trip: trip_without_distance } }

    it 'return status code 200' do
      expect(response).to have_http_status(201)
    end
  end
end
