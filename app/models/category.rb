class Category < ActiveRecord::Base
  # id should not be here! but since i'm using mass assigning to set the default values it has to be here :p
  # this table should be read only! NEVER CREATE METHODS TO WRITE INTO THE DATABASE FOR THIS MODEL.
  attr_accessible :name, :description, :icon_id, :published, :id
end