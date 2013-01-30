class MetaGroup < ActiveRecord::Base
  attr_accessible :id,
                  :name,
                  :description,
                  :icon_id
end