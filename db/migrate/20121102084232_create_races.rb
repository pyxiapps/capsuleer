class CreateRaces < ActiveRecord::Migration
  def change
    create_table :races, :id => false do |t|
      t.integer :id
      t.string :name, :description, :short_description
    end
  end
end
