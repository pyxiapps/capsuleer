class AttributeEnhancer
  include Mongoid::Document

  embedded_in :character

end
