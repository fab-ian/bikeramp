# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Trip, types: :request do
  let(:parsed_response) { JSON.parse(response.body) }

  describe 'GET /api/stats/monthly' do
    before do
      create(:trip, date: Date.today.beginning_of_week.to_s, price: 40, distance: 20)
      create(:trip, date: 2.day.since(Date.today.beginning_of_week).to_s, price: 10, distance: 5)
      create(:trip, date: 2.day.since(Date.today.beginning_of_week).to_s, price: 14, distance: 7)

      get '/api/stats/monthly'
    end

    it 'return status code 200' do
      expect(response).to have_http_status(200)
    end

    it 'returns total_distance 12km on wednesday' do
      expect(parsed_response[1]['total_distance']).to eq('12km')
    end

    it 'returns avg_price 12km on wednesday' do
      expect(parsed_response[1]['avg_price']).to eq('12.00PLN')
    end

    it 'returns avg_ride 6km on wednesday' do
      expect(parsed_response[1]['avg_ride']).to eq('6km')
    end
  end
end
