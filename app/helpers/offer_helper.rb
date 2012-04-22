# encoding: utf-8
module OfferHelper

  def price(price)
    price = sprintf("%5.2f", price)
    if price =~ /\./
      raw price.gsub('.', '<span class="smaller">,') + '€</span>' # => take this to database level (localization)
    else
      raw price + '<span class="smaller>€</span>'
    end
  end

  def discount(offer)
    offer.discount.to_s + '%'
  end

  def win(offer)
    (offer.initial_price - offer.price).to_s.gsub('.', ',') + '€'
  end

  def expires(offer)
    distance_of_time_in_words(Time.now, offer.expires_on + 1)
  end

end