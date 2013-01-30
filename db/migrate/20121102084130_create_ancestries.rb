class CreateAncestries < ActiveRecord::Migration
  def change
    create_table :ancestries, :id => false do |t|
      t.integer :id
      t.string :name, :description, :short_description
      t.integer :bloodline_id, :perception, :willpower, :charisma, :memory, :intelligence, :icon_id
    end
  end
end
