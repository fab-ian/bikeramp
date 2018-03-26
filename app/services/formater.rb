# frozen_string_literal: true

class Formater
  def self.km_format(kilometers)
    "#{kilometers.round}km"
  end

  def self.price_format(price)
    "#{format('%.2f', price)}PLN"
  end
end
