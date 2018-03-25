# frozen_string_literal: true

class Trip < ApplicationRecord
  validates :start_address, :destination_address, :price, :distance, :date, presence: true
  validates :price, :distance, numericality: true
end
