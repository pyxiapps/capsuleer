class MetaType < ActiveRecord::Base
  attr_accessible :inventory_id,
                  :parent_type_id,
                  :meta_group_id
end