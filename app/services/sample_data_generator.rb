# frozen_string_literal: true

class SampleDataGenerator
  def self.generate
    Trip.destroy_all

    date = 4.days.ago

    15.times do
      date += 1.day

      rand(1..3).times do
        create_trip(date)
      end
    end

    puts 'Sample data have been generated'
  end

  def self.create_trip(date)
    distance = rand(1..20)
    price = 4 * distance

    Trip.create!(start_address: adres, destination_address: adres, distance: distance, price: price, date: date)
  end

  def self.adres
    "#{Faker::Address.street_name}, #{Faker::Address.city}, #{Faker::Address.country}"
  end
end
