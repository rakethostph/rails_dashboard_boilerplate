class AddProductIdToWarranties < ActiveRecord::Migration[5.2]
  def change
    add_column :warranties, :product_id, :integer
  end
end
