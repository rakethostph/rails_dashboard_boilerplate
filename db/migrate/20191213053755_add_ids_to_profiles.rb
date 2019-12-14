class AddIdsToProfiles < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :distributor_id, :integer
    add_column :profiles, :agent_id, :integer
  end
end
