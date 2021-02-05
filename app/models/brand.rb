class Brand < ApplicationRecord
    has_many :shoes, dependent: :destroy
    has_many :users, through: :shoes
    validates :name, presence: true, uniqueness: { case_sensitive: false }

    # accepts_nested_attributes_for :shoes, reject_if: proc {|attr| attr['color'].blank? || attr['price'].blank?}
    
    # def shoes_attributes=(attr)
    #     attr.each do | k, v |
    #         User.find_by(session[:user_id]).shoes.create(v) if !v[:price].blank?
    #     end 
    # end 
end
