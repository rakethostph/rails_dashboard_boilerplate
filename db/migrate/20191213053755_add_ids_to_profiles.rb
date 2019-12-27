class AddIdsToProfiles < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :admin_id, :integer
    add_column :users, :distributor_id, :integer
    add_column :users, :agent_id, :integer
    add_column :users, :client_id, :integer
  end
end
