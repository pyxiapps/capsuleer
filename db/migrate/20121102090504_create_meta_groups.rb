class CreateMetaGroups < ActiveRecord::Migration
  def change
    create_table :meta_groups, :id => false do |t|
      t.integer :id, :icon_id
      t.string :name, :description
    end
  end
end