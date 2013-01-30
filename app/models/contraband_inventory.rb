class ContrabandInventory < ActiveRecord::Base
  attr_accessible :faction_id,
                  :inventory_id,
                  :standing_loss,
                  :confiscate_min_sec,
                  :fine_by_value,
                  :attack_min_sec
end