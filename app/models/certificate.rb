class Certificate
  include Mongoid::Document
  embedded_in :character
end
