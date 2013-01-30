class Attribute < ActiveRecord::Base
  attr_accessible :id, :name, :description, :icon_id, :short_description, :notes
end