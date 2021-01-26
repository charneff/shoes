class Brand < ApplicationRecord
    has_many :shoes, dependent: :destroy
    validates :name, presence: true, uniqueness: { case_sensitive: false }

    accepts_nested_attributes_for :shoes, reject_if: proc {|attr| attr['color'].blank? || attr['price'].blank?}
end
