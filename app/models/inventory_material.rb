class InventoryMaterial < ActiveRecord::Base
  attr_accessible :inventory_id,
                  :material_type_id,
                  :quantity
end