class CreateFactions < ActiveRecord::Migration
  def change
    create_table :factions, :id => false do |t|
      t.integer :id
      t.string :name, :description
      t.integer :race_id, :solar_system_id, :corporation_id, :militia_corporation_id, :icon_id, :station_count, :station_system_count, :size_factor
    end
  end
end
