# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Trip, type: :model do
  let(:valid_data) { attributes_for(:trip) }

  it { should validate_presence_of(:start_address) }
  it { should validate_presence_of(:destination_address) }
  it { should validate_presence_of(:price) }
  it { should validate_presence_of(:distance) }
  it { should validate_presence_of(:date) }

  it { should validate_numericality_of(:price) }
  it { should validate_numericality_of(:distance) }

  it 'can be created with valid data' do
    trip = Trip.new(valid_data)
    expect(trip.save).to eq(true)
  end
end
