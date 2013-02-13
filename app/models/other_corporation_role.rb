class OtherCorporationRole
  include Mongoid::Document
  embedded_in :character
end
