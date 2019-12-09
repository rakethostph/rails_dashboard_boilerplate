class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :product_cover
      t.string :product_name
      t.string :product_price
      t.string :product_description

      t.timestamps
    end
  end
end
