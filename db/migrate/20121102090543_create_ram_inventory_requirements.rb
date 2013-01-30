class CreateRamInventoryRequirements < ActiveRecord::Migration
  def change
    create_table :ram_inventory_requirements, :id => false do |t|
      t.integer :inventory_id, :activity_id, :required_type_id, :quantity, :recycle
      t.decimal :recycle
    end
  end
end
