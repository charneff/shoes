class RemoveBrandFromShoes < ActiveRecord::Migration[6.0]
  def change
    remove_column :shoes, :brand, :string
  end
end
