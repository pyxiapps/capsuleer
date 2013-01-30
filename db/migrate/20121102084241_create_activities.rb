class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities, :id => false do |t|
      t.integer :id
      t.string :name, :description
    end
  end
end