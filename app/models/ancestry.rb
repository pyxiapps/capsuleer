class Ancestry < ActiveRecord::Base
  attr_accessible :id, :name, :bloodline_id, :description, :perception, :willpower, :charisma, :memory, :intelligence,
    :icon_id, :short_description
end