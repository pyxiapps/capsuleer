class CreateEveUnits < ActiveRecord::Migration
  def change
    create_table :eve_units, :id => false do |t|
      t.integer :id
      t.string :name, :display_name, :description
    end
  end
end
