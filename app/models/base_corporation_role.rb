class BaseCorporationRole
  include Mongoid::Document
  embedded_in :character
end
