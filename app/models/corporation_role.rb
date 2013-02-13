class CorporationRole
  include Mongoid::Document
  embedded_in :character
end
