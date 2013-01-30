class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories, :id => false do |t|
      t.integer :id
      t.string :name, :description
      t.integer :icon_id, :published
    end
  end
end
