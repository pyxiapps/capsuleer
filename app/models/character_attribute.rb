class CharacterAttribute
  include Mongoid::Document
  embedded_in :character
end
