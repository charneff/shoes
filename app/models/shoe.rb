class Shoe < ApplicationRecord
    validates :price, :color, presence: true
    validates :price, numericality: { greater_than: 0 }
    # validates :brand, uniqueness: { scope: [:price, :color], message: 'already has that price & color combo' }
    validates :price, confirmation: true
    # validates :price_confirmation, presence: true
    # validates :color, two_word: true
    belongs_to :brand 
    scope :ordered_by_price, -> { order(price: :desc) }
    # accepts_nested_attributes_for :brand

    def brand_attributes=(attr)
        if !attr[:name].blank?
            self.brand = Brand.find_or_create_by(name: attr[:name], owner: attr[:owner])
        end 
    end 

    # def self.ordered_by_price
    #     #self.all.sort_by{|shoe| shoe.price}.last ##loads all records into RAM, then sorts
    #     self.order(:limited_edition).order(price: :desc) ##database handles sorting
    # end

    def brand_and_color
        "#{self.brand.name} - #{self.color}"
    end

end
