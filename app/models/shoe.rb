class Shoe < ApplicationRecord
    validates :price, :color, presence: true
    validates :price, numericality: { greater_than: 0 }
    validates :brand, uniqueness: { scope: [:price, :color], message: 'already has that price & color combo' }
    validates :price, confirmation: true
    validates :price_confirmation, presence: true
    validates :color, two_word: true

    def self.ordered_by_price
        #self.all.sort_by{|shoe| shoe.price}.last ##loads all records into RAM, then sorts
        self.order(price: :desc) ##database handles sorting
    end

    def brand_and_color
        "#{self.brand} - #{self.color}"
    end

end
