class CreateWarranties < ActiveRecord::Migration[5.2]
  def change
    create_table :warranties do |t|
      t.string :product_name
      t.string :product_serial_number
      t.integer :client_id

      t.timestamps
    end
  end
end
