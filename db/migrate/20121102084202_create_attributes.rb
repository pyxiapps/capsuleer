class CreateAttributes < ActiveRecord::Migration
  def change
    create_table :attributes, :id => false do |t|
      t.integer :id
      t.string :name, :description, :short_description, :notes
      t.integer :icon_id
    end
  end
end
