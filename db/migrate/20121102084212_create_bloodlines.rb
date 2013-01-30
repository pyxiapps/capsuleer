class CreateBloodlines < ActiveRecord::Migration
  def change
    create_table :bloodlines, :id => false do |t|
      t.integer :id
      t.string :name, :description, :male_description, :female_description, :short_description, :short_male_description, :short_female_description
      t.integer :race_id, :ship_type_id, :corporation_id, :perception, :willpower, :charisma, :memory, :intelligence, :icon_id
    end
  end
end
