# List of Available Character related API Modules
#
# Eve::API::Services::Character::   api.character.character_sheet
# Eve::API::Services::Character::   api.character.fac_war_stats
# Eve::API::Services::Character::   api.character.medals
# Eve::API::Services::Character::   api.character.skill_in_training
# Eve::API::Services::Character::   api.character.skill_queue
# Eve::API::Services::Character::   api.character.standings
# Eve::API::Services::Character::   api.character.account_balance
# Eve::API::Services::Character::   api.character.asset_list(version = nil)
# Eve::API::Services::Character::   api.character.industry_jobs
# Eve::API::Services::Character::   api.character.kill_log(options = {})
# Eve::API::Services::Character::   api.character.mailing_lists
# Eve::API::Services::Character::   api.character.mail_messages
# Eve::API::Services::Character::   api.character.market_orders
# Eve::API::Services::Character::   api.character.notifications
# Eve::API::Services::Character::   api.character.research
# Eve::API::Services::Character::   api.character.wallet_journal(account_key = 1000, options = {})
# Eve::API::Services::Character::   api.character.journal_entries(account_key = 1000, options = {})
# Eve::API::Services::Character::   api.character.wallet_transactions(options = {})
#
class Character
  include Mongoid::Document

  embedded_in :account

  embeds_many :attribute_enhancers
  embeds_many :character_attributes
  embeds_many :skills
  embeds_many :certificates
  embeds_many :corporation_roles
  embeds_many :hq_corporation_roles
  embeds_many :base_corporation_roles
  embeds_many :other_corporation_roles
  embeds_many :corporation_titles

  field :name, type: String
  field :character_id, type: Integer
  field :corporation_name, type: String
  field :corporation_id, type: Integer

  field :cached_until, type: DateTime
  field :do_b, type: DateTime
  field :race, type: String
  field :blood_line, type: String
  field :ancestry, type: String
  field :gender, type: String
  field :alliance_name, type: String
  field :alliance_id, type: Integer
  field :clone_name, type: String
  field :clone_skill_points, type: Integer
  field :balance, type: Float
  field :api_version, type: String

  validates_presence_of :name, :character_id
  
  def fetch_character_sheet_information
    # Get API connection from account record
    conn ||= self.account.get_api_conn
    # Set the character id to define which character to perform operation with
    conn.set(:character_id => self.character_id)
    conn.character.character_sheet
  end

  def save_character_sheet_information(char_sheet)
    # Loop thru all available fields from this model
    self.fields.keys.each do |field|
      # If field can be found on eve API response assign it to model field
      if char_sheet.all_fields.include?(field)
        self.send("#{field}=",char_sheet.send(field))
      end
    end
    self.save
  end

  def fetch_and_save_character_sheet_information
    self.save_character_sheet_information(self.fetch_character_sheet_information)
  end

end
