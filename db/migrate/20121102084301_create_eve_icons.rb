class CreateEveIcons < ActiveRecord::Migration
  def change
    create_table :eve_icons, :id => false do |t|
      t.integer :id
      t.string :file, :description
    end
  end
end
