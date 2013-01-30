class Faction < ActiveRecord::Base
  attr_accessible :id,
                  :name,
                  :description,
                  :race_id,
                  :solar_system_id,
                  :corporation_id,
                  :size_factor,
                  :station_count,
                  :station_system_count,
                  :militia_corporation_id,
                  :icon_id
end