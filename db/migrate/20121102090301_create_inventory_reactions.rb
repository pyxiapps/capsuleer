class CreateInventoryReactions < ActiveRecord::Migration
  def change
    create_table :inventory_reactions, :id => false do |t|
      t.integer :inventory_reaction_id, :input, :inventory_id, :quantity
    end
  end
end
