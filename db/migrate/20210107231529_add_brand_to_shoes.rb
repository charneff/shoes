class AddBrandToShoes < ActiveRecord::Migration[6.0]
  def change
    add_reference :shoes, :brand, null: false, foreign_key: true
  end
end
