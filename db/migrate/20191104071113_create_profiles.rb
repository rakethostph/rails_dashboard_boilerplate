class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :avatar
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :mobile_phone
      t.integer :gender
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :country
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
