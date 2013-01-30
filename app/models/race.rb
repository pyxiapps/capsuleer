class Race < ActiveRecord::Base
  attr_accessible :id,
                  :name,
                  :description,
                  :short_description
end