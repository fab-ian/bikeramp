# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Trip, types: :request do
  let(:parsed_response) { JSON.parse(response.body) }

  describe 'GET /api/stats/weekly' do
    before do
      create(:trip, date: Date.today.beginning_of_week.to_s, price: 40, distance: 20)
      create(:trip, date: 2.day.since(Date.today.beginning_of_week).to_s, price: 10, distance: 5)
      create(:trip, date: 3.day.since(Date.today.beginning_of_week).to_s, price: 14, distance: 7)

      get '/api/stats/weekly'
    end

    it 'return status code 200' do
      expect(response).to have_http_status(200)
    end

    it 'returns total_price 64.00PLN' do
      expect(parsed_response['total_price']).to eq('64.00PLN')
    end

    it 'returns total_distance 32km' do
      expect(parsed_response['total_distance']).to eq('32km')
    end

    it 'does not returns total_distance 320km' do
      expect(parsed_response['total_distance']).not_to eq('320km')
    end
  end
end
