class EveUnit < ActiveRecord::Base
  attr_accessible :id,
                  :name,
                  :display_name,
                  :description
end