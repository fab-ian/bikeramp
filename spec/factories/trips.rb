# frozen_string_literal: true

FactoryBot.define do
  factory :trip do
    start_address 'Plac Wilsona, Warszawa, Polska'
    destination_address 'Plac Inwalidów, Warszawa, Polska'
    price '100.50'
    distance '1.65'
    date '2018-04-02'
  end
end
