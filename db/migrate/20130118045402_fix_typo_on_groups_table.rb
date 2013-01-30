class FixTypoOnGroupsTable < ActiveRecord::Migration
  def up
    rename_column :groups, :use_base_price, :user_base_price
  end

  def down
    rename_column :groups, :user_base_price, :use_base_price
  end
end
