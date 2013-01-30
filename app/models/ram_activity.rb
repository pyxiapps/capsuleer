class RamActivity < ActiveRecord::Base
  attr_accessible :id,
                  :name,
                  :icon_no,
                  :description,
                  :published
end