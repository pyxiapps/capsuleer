# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130130104301) do

  create_table "activities", :id => false, :force => true do |t|
    t.integer "id"
    t.string  "name"
    t.string  "description"
  end

  create_table "ancestries", :id => false, :force => true do |t|
    t.integer "id"
    t.string  "name"
    t.string  "description"
    t.string  "short_description"
    t.integer "bloodline_id"
    t.integer "perception"
    t.integer "willpower"
    t.integer "charisma"
    t.integer "memory"
    t.integer "intelligence"
    t.integer "icon_id"
  end

  create_table "attributes", :id => false, :force => true do |t|
    t.integer "id"
    t.string  "name"
    t.string  "description"
    t.string  "short_description"
    t.string  "notes"
    t.integer "icon_id"
  end

  create_table "bloodlines", :id => false, :force => true do |t|
    t.integer "id"
    t.string  "name"
    t.string  "description"
    t.string  "male_description"
    t.string  "female_description"
    t.string  "short_description"
    t.string  "short_male_description"
    t.string  "short_female_description"
    t.integer "race_id"
    t.integer "ship_type_id"
    t.integer "corporation_id"
    t.integer "perception"
    t.integer "willpower"
    t.integer "charisma"
    t.integer "memory"
    t.integer "intelligence"
    t.integer "icon_id"
  end

  create_table "blueprint_inventories", :id => false, :force => true do |t|
    t.integer "blueprint_inventory_id"
    t.integer "parent_blueprint_inventory_id"
    t.integer "product_inventory_id"
    t.integer "production_time"
    t.integer "tech_level"
    t.integer "research_productivity_time"
    t.integer "research_material_time"
    t.integer "research_copy_time"
    t.integer "research_tech_time"
    t.integer "productivity_modifier"
    t.integer "material_modifier"
    t.integer "waste_factor"
    t.integer "max_production_limit"
  end

  create_table "categories", :id => false, :force => true do |t|
    t.integer "id"
    t.string  "name"
    t.string  "description"
    t.integer "icon_id"
    t.integer "published"
  end

  create_table "contraband_inventories", :id => false, :force => true do |t|
    t.integer "faction_id"
    t.integer "inventory_id"
    t.integer "standing_loss"
    t.decimal "confiscate_min_sec", :precision => 10, :scale => 0
    t.decimal "fine_by_value",      :precision => 10, :scale => 0
    t.decimal "attack_min_sec",     :precision => 10, :scale => 0
  end

  create_table "eve_icons", :id => false, :force => true do |t|
    t.integer "id"
    t.string  "file"
    t.string  "description"
  end

  create_table "eve_units", :id => false, :force => true do |t|
    t.integer "id"
    t.string  "name"
    t.string  "display_name"
    t.string  "description"
  end

  create_table "factions", :id => false, :force => true do |t|
    t.integer "id"
    t.string  "name"
    t.string  "description"
    t.integer "race_id"
    t.integer "solar_system_id"
    t.integer "corporation_id"
    t.integer "militia_corporation_id"
    t.integer "icon_id"
    t.integer "station_count"
    t.integer "station_system_count"
    t.integer "size_factor"
  end

  create_table "groups", :id => false, :force => true do |t|
    t.integer "id"
    t.integer "category_id"
    t.integer "icon_id"
    t.integer "user_base_price"
    t.integer "allow_manufacture"
    t.integer "allow_recycler"
    t.integer "anchored"
    t.integer "anchorable"
    t.integer "fittable_non_singleton"
    t.integer "published"
    t.string  "name"
    t.string  "description"
  end

  create_table "inventories", :id => false, :force => true do |t|
    t.integer "id"
    t.string  "name"
    t.string  "description"
    t.integer "group_id"
    t.integer "portion_size"
    t.integer "race_id"
    t.integer "published"
    t.integer "market_group_id"
    t.integer "icon_id"
    t.float   "mass"
    t.float   "volume"
    t.float   "capacity"
    t.float   "chance_of_duplicating"
    t.decimal "base_price",            :precision => 10, :scale => 0
  end

  create_table "inventory_materials", :id => false, :force => true do |t|
    t.integer "inventory_id"
    t.integer "material_type_id"
    t.integer "quantity"
  end

  create_table "inventory_reactions", :id => false, :force => true do |t|
    t.integer "inventory_reaction_id"
    t.integer "input"
    t.integer "inventory_id"
    t.integer "quantity"
  end

  create_table "market_groups", :id => false, :force => true do |t|
    t.integer "id"
    t.integer "parent_group_id"
    t.integer "icon_id"
    t.integer "has_types"
    t.string  "name"
    t.string  "description"
  end

  create_table "meta_groups", :id => false, :force => true do |t|
    t.integer "id"
    t.integer "icon_id"
    t.string  "name"
    t.string  "description"
  end

  create_table "meta_types", :id => false, :force => true do |t|
    t.integer "inventory_id"
    t.integer "parent_type_id"
    t.integer "meta_group_id"
  end

  create_table "races", :id => false, :force => true do |t|
    t.integer "id"
    t.string  "name"
    t.string  "description"
    t.string  "short_description"
  end

  create_table "ram_activities", :id => false, :force => true do |t|
    t.integer "id"
    t.integer "published"
    t.string  "name"
    t.string  "icon_no"
    t.string  "description"
  end

  create_table "ram_inventory_requirements", :id => false, :force => true do |t|
    t.integer "inventory_id"
    t.integer "activity_id"
    t.integer "required_type_id"
    t.integer "quantity"
    t.integer "recycle"
    t.float   "damage_per_job"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "name"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
