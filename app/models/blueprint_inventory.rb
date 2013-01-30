class BlueprintInventory < ActiveRecord::Base
  attr_accessible :blueprint_inventory_id, :parent_blueprint_inventory_id, :product_inventory_id, :production_time, :tech_level,
    :research_productivity_time, :research_material_time, :research_copy_time, :research_tech_time, :productivity_modifier,
    :material_modifier, :waste_factor, :max_production_limit
end