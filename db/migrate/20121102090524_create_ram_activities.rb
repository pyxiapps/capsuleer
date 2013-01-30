class CreateRamActivities < ActiveRecord::Migration
  def change
    create_table :ram_activities, :id => false do |t|
      t.integer :id, :published
      t.string :name, :icon_no, :description
    end
  end
end
