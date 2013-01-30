class AddMissingColumns < ActiveRecord::Migration
  def up
    change_table :ram_inventory_requirements do |t|
      t.float :damage_per_job
    end
  end

  def down
    change_table :ram_inventory_requirements do |t|
      t.remove :damage_per_job
    end
  end
end
