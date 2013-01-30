class Bloodline < ActiveRecord::Base
  attr_accessible :id, :name, :race_id, :description, :male_description, :female_description, :ship_type_id,
    :corporation_id, :perception, :willpower, :charisma, :memory, :intelligence, :icon_id, :short_description,
    :short_male_description, :short_female_description
end