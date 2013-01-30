class CreateBlueprintInventories < ActiveRecord::Migration
  def change
    create_table :blueprint_inventories, :id => false do |t|
      t.integer :blueprint_inventory_id, :parent_blueprint_inventory_id, :product_inventory_id, :production_time
      t.integer :tech_level, :research_productivity_time, :research_material_time, :research_copy_time, :research_tech_time
      t.integer :productivity_modifier, :material_modifier, :waste_factor, :max_production_limit
    end
  end
end
