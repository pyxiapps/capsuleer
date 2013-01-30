class CreateInventoryMaterials < ActiveRecord::Migration
  def change
    create_table :inventory_materials, :id => false do |t|
      t.integer :inventory_id, :material_type_id, :quantity
    end
  end
end
