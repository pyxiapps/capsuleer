class InventoryReaction < ActiveRecord::Base
  attr_accessible :inventory_reaction_id,
                  :input,
                  :inventory_id,
                  :quantity
end