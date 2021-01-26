class CreateShoes < ActiveRecord::Migration[6.0]
  def change
    create_table :shoes do |t|
      t.string :brand ##this will become new table
      t.string :color
      t.float :price
      t.boolean :limited_edition

      t.timestamps
    end
  end
end
