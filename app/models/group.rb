class Group < ActiveRecord::Base
  attr_accessible :id,
                  :name,
                  :category_id,
                  :description,
                  :icon_id,
                  :user_base_price,
                  :allow_manufacture,
                  :allow_recycler,
                  :anchored,
                  :anchorable,
                  :fittable_non_singleton,
                  :published   
end