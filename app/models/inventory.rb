class Inventory < ActiveRecord::Base
  attr_accessible :id,
                  :group_id,
                  :name,
                  :description,
                  :mass,
                  :volume,
                  :capacity,
                  :portion_size,
                  :race_id,
                  :base_price,
                  :published,
                  :market_group_id,
                  :chance_of_duplicating,
                  :icon_id
end