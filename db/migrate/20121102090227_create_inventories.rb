class CreateInventories < ActiveRecord::Migration
  def change
    create_table :inventories, :id => false do |t|
      t.integer :id
      t.string :name, :description
      t.integer :group_id, :portion_size, :race_id, :published, :market_group_id, :icon_id
      t.float :mass, :volume, :capacity, :chance_of_duplicating
      t.decimal :base_price
    end
  end
end
