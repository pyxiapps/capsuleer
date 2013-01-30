class CreateContrabandInventories < ActiveRecord::Migration
  def change
    create_table :contraband_inventories, :id => false do |t|
      t.integer :faction_id, :inventory_id, :standing_loss
      t.decimal :confiscate_min_sec, :fine_by_value, :attack_min_sec
    end
  end
end
