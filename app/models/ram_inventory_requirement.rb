class RamInventoryRequirement < ActiveRecord::Base
  attr_accessible :inventory_id,
                  :activity_id,
                  :required_type_id,
                  :quantity,
                  :damage_per_job,
                  :recycle
end