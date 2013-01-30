class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups, :id => false do |t|
      t.integer :id, :category_id, :icon_id, :use_base_price, :allow_manufacture, :allow_recycler, :anchored
      t.integer :anchorable, :fittable_non_singleton, :published
      t.string :name, :description
    end
  end
end
