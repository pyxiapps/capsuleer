# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) are set in the file config/application.yml.
# See http://railsapps.github.com/rails-environment-variables.html
puts 'DEFAULT USERS'
user = User.find_or_create_by_email :name => ENV['ADMIN_NAME'].dup, :email => ENV['ADMIN_EMAIL'].dup, :password => ENV['ADMIN_PASSWORD'].dup, :password_confirmation => ENV['ADMIN_PASSWORD'].dup
puts 'user: ' << user.name

      # # # # # # # # # # # # # # # # # # # # # # # # #
      #  UTILITY METHODS USED THROUGHOUT THIS SCRIPT  #
      # # # # # # # # # # # # # # # # # # # # # # # # #

# Function to retrieve all data from Eve Dump Database and 
# Import all the data into the new schema/db
def fetch_and_import!(opts={})
  eve_table = opts[:eve_table]
  dest_table = opts[:dest_table]
  mapping = opts[:mapping]
  dbh = opts[:conn] || @dbh
  comment_label = opts[:label]
  
  # Fetch Data from crpActivities Table
  results = dbh.query("SELECT * FROM "+eve_table)
  # Clear Destination Table to eliminate Redundancy
  dest_table.camelize.constantize.delete_all
  # Do some Meta programming FU magic
  results.each do |row|
    insert_map = {}
    mapping.each do |key,value|
      insert_map[key.to_sym] = row[value]
    end    
    dest_table.camelize.constantize.create!(insert_map)
    # Just so you see something when running this script..
    p "Creating Record for #{dest_table} : " + row[comment_label].to_s
  end
end


def sql_dump_exists?
  
end

def create_sql_dump
  
end

      # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
      #  INITIAL SEED, IMPORT EVE LOOKUP TABLES INTO APP DATABASE FOLLOWING RAILS CONVENTIONS #
      # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# 1. Check if sql dump file exists, if it exists we have done this before and we dont have to do it again
unless sql_dump_exists?
  
  
# 2. Connect to Eve Dump Database to retrieve data that is relevant to current application
  
  # Check if database eve_dump exists
  # If it exists do nothing
  # If it doesn't create it and populate it with current sql dump

  # Connect to eve_dump database via Mysql2 Gem ( old school style! for better performance )
  @dbh = Mysql2::Client.new(:host => "localhost", :username => "root", :database => "eve_dump", :password => 'xs4Raymond')
  
  # Do the actual DB import process
  p 'Working on Activities ...'
  fetch_and_import!(:eve_table => 'crpActivities', :dest_table => 'activity', :conn => @dbh, :label => 'activityName', 
    :mapping => {
      'id' => 'activityID',
      'name' => 'activityName',
      'description' => 'description'
    }
  )
  p 'Working on Ancestries ...'
  fetch_and_import!(:eve_table => 'chrAncestries', :dest_table => 'ancestry', :conn => @dbh, :label => 'ancestryName', 
    :mapping => {
      'id' => 'ancestryID',
      'name' => 'ancestryName',
      'bloodline_id' => 'bloodlineID',
      'description' => 'description',
      'perception' => 'perception',
      'willpower' => 'willpower',
      'charisma' => 'charisma', 
      'memory' => 'memory',
      'intelligence' => 'intelligence',
      'icon_id' => 'iconID',
      'short_description' => 'shortDescription'
    }
  )
  p 'Working on Attributes'
  fetch_and_import!(:eve_table => 'chrAttributes', :dest_table => 'attribute', :conn => @dbh, :label => 'attributeName', 
    :mapping => {
      'id' => 'attributeID',
      'name' => 'attributeName',
      'description' => 'description',
      'icon_id' => 'iconID',
      'short_description' => 'shortDescription',
      'notes' => 'notes'
    }
  )
  p 'Working on Bloodlines'
  fetch_and_import!(:eve_table => 'chrBloodlines', :dest_table => 'bloodline', :conn => @dbh, :label => 'bloodlineName',
    :mapping => {
      'id' => 'bloodlineID',
      'name' => 'bloodlineName',
      'race_id' => 'raceID',
      'description' => 'description',
      'male_description' => 'maleDescription',
      'female_description' => 'femaleDescription',
      'ship_type_id' => 'shipTypeID',
      'corporation_id' => 'corporationID',
      'perception' => 'perception',
      'willpower' => 'willpower',
      'charisma' => 'charisma',
      'memory' => 'memory',
      'intelligence' => 'intelligence',
      'icon_id' => 'iconID',
      'short_description' => 'shortDescription',
      'short_male_description' => 'shortMaleDescription',
      'short_female_description' => 'shortFemaleDescription'
    }
  )
  p 'Working on Blueprint Inventories'
  fetch_and_import!(:eve_table => 'invBlueprintTypes', :dest_table => 'blueprint_inventory', :conn => @dbh, :label => 'blueprintTypeID',
    :mapping => {
      'blueprint_inventory_id' => 'blueprintTypeID',
      'parent_blueprint_inventory_id' => 'parentBlueprintTypeID',
      'product_inventory_id' => 'productTypeID',
      'production_time' => 'productionTime',
      'tech_level' => 'techLevel',
      'research_productivity_time' => 'researchProductivityTime',
      'research_material_time' => 'researchMaterialTime',
      'research_copy_time' => 'researchCopyTime',
      'research_tech_time' => 'researchTechTime',
      'productivity_modifier' => 'productivityModifier',
      'material_modifier' => 'materialModifier',
      'waste_factor' => 'wasteFactor',
      'max_production_limit' => 'maxProductionLimit'
    }
  )
  p 'Working on Categories ( for Inventories )'
  fetch_and_import!(:eve_table => 'invCategories', :dest_table => 'category', :conn => @dbh, :label => 'categoryName', 
    :mapping => {
      'id' => 'categoryID',
      'name' => 'categoryName',
      'description' => 'description',
      'icon_id' => 'iconID',
      'published' => 'published'
    }
  )
  p 'Working on Contraband Inventories'
  fetch_and_import!(:eve_table => 'invContrabandTypes', :dest_table => 'contraband_inventory', :label => 'factionID',
    :mapping => {
      'faction_id' => 'factionID',
      'inventory_id' => 'typeID',
      'standing_loss' => 'standingLoss',
      'confiscate_min_sec' => 'confiscateMinSec',
      'fine_by_value' => 'fineByValue',
      'attack_min_sec' => 'attackMinSec'
    }
  )
  p 'Working on Eve Icons'
  fetch_and_import!(:eve_table => 'eveIcons', :dest_table => 'eve_icon', :label => 'iconID',
    :mapping => {
      'id' => 'iconID',
      'file' => 'iconFile',
      'description' => 'description'
    }
  )
  p 'Working on Eve Units'
  fetch_and_import!(:eve_table => 'eveUnits', :dest_table => 'eve_unit', :label => 'unitName',
    :mapping => {
      'id' => 'unitID',
      'name' => 'unitName',
      'display_name' => 'displayName',
      'description' => 'description'
    }
  )
  p 'Working on Factions'
  fetch_and_import!(:eve_table => 'chrFactions', :dest_table => 'faction', :label => 'factionName',
    :mapping => {
      'id' => 'factionID',
      'name' => 'factionName',
      'description' => 'description',
      'race_id' => 'raceIDs',
      'solar_system_id' => 'solarSystemID',
      'corporation_id' => 'corporationID',
      'size_factor' => 'sizeFactor',
      'station_count' => 'stationCount',
      'station_system_count' => 'stationSystemCount',
      'militia_corporation_id' => 'militiaCorporationID',
      'icon_id' => 'iconID'
    }
  )
  p 'Working on groups'
  fetch_and_import!(:eve_table => 'invGroups', :dest_table => 'group', :label => 'groupName',
    :mapping => {
      'id' => 'groupID',
      'name' => 'groupName',
      'category_id' => 'categoryID',
      'description' => 'description',
      'icon_id' => 'iconID',
      'user_base_price' => 'userBasePrice',
      'allow_manufacture' => 'allowManufacture',
      'allow_recycler' => 'allowRecycler',
      'anchored' => 'anchored',
      'anchorable' => 'anchorable',
      'fittable_non_singleton' => 'fittable_non_singleton',
      'published' => 'published'
    }
  )
  p 'Working on inventories'
  fetch_and_import!(:eve_table => 'invTypes', :dest_table => 'inventory', :label => 'typeName',
    :mapping => {
      'id' => 'typeID',
      'group_id' => 'groupID',
      'name' => 'typeName',
      'description' => 'description',
      'mass' => 'mass',
      'volume' => 'volume',
      'capacity' => 'capacity',
      'portion_size' => 'portion_size',
      'race_id' => 'raceID',
      'base_price' => 'basePrice',
      'published' => 'published',
      'market_group_id' => 'marketGroupID',
      'chance_of_duplicating' => 'chanceOfDuplicating',
      'icon_id' => 'iconID'
    }
  )
  p 'Working on Inventory Materials'
  fetch_and_import!(:eve_table => 'invTypeMaterials', :dest_table => 'inventory_material', :label => 'typeID',
    :mapping => {
      'inventory_id' => 'typeID',
      'material_type_id' => 'materialTypeID',
      'quantity' => 'quantity'
    }
  )
  p 'Working on Inventory Reactions'
  fetch_and_import!(:eve_table => 'invTypeReactions', :dest_table => 'inventory_reaction', :label => 'input',
    :mapping => {
      'inventory_reaction_id' => 'reactionTypeID',
      'input' => 'input',
      'inventory_id' => 'typeID',
      'quantity' => 'quantity'
    }
  )
  p 'Working on Market Groups'
  fetch_and_import!(:eve_table => 'invMarketGroups', :dest_table => 'market_group', :label => 'marketGroupName',
    :mapping => {
      'id' => 'marketGroupID',
      'parent_group_id' => 'parentGroupID',
      'name' => 'marketGroupName',
      'description' => 'description',
      'icon_id' => 'iconID',
      'has_types' => 'hasTypes'
    }
  )
  p 'Working on Meta Groups'
  fetch_and_import!(:eve_table => 'invMetaGroups', :dest_table => 'meta_group', :label => 'metaGroupName',
    :mapping => {
      'id' => 'metaGroupID',
      'name' => 'metaGroupName',
      'description' => 'description',
      'icon_id' => 'iconID'
    }
  ) 
  p 'Working on Meta Types'
  fetch_and_import!(:eve_table => 'invMetaTypes', :dest_table => 'meta_type', :label => 'metaGroupID',
    :mapping => {
      'inventory_id' => 'typeID',
      'parent_type_id' => 'parentTypeID',
      'meta_group_id' => 'metaGroupID'
    }
  )
  p 'Working on Races'
  fetch_and_import!(:eve_table => 'chrRaces', :dest_table => 'race', :label => 'raceName',
    :mapping => {
      'id' => 'raceID',
      'name' => 'raceName',
      'description' => 'description',
      'short_description' => 'shortDescription'
    }
  )
  p 'Working on R.A.M. Activities'
  fetch_and_import!(:eve_table => 'ramActivities', :dest_table => 'ram_activity', :label => 'activityName',
    :mapping => {
      'id' => 'activityID',
      'name' => 'activityName',
      'icon_no' => 'iconNo',
      'description' => 'description',
      'published' => 'published'
    }
  )
  p 'Working on R.A.M. Inventory Requirements'
  fetch_and_import!(:eve_table => 'ramTypeRequirements', :dest_table => 'ram_inventory_requirement', :label => 'typeID',
    :mapping => {
      'inventory_id' => 'typeID',
      'activity_id' => 'activityID',
      'required_type_id' => 'requiredTypeID',
      'quantity' => 'quantity',
      'damage_per_job' => 'damagePerJob',
      'recycle' => 'recycle'
    }
  )




  create_sql_dump

end

# 3. If all is good ( no errors! no changes! ) create data dump file so this process does not run again when running 
#  rake db:seed. Proceed with other seeding procedures.

      # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
      #  OTHER SEEDING PROCEDURES GO HERE! WELL BELOW THIS COMMENT DUH! #
      # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #


