class CreateMarketGroups < ActiveRecord::Migration
  def change
    create_table :market_groups, :id => false do |t|
      t.integer :id, :parent_group_id, :icon_id, :has_types
      t.string :name, :description
    end
  end
end
