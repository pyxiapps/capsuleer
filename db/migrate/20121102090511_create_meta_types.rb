class CreateMetaTypes < ActiveRecord::Migration
  def change
    create_table :meta_types, :id => false do |t|
      t.integer :inventory_id, :parent_type_id, :meta_group_id
    end
  end
end
