class MarketGroup < ActiveRecord::Base
  attr_accessible :id,
                  :parent_group_id,
                  :name,
                  :description,
                  :icon_id,
                  :has_types
end