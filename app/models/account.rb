class Account
  include Mongoid::Document

  field :key_id, type: String
  field :v_code, type: String
  field :user_id, type: Integer

  embeds_many :characters

  validates_uniqueness_of :key_id
  validates_uniqueness_of :v_code
  validates_presence_of :key_id, :v_code

  after_save :update_character_list

  def is_working_auth_key?
    (@api ||= get_api_conn)
  end

  def get_api_conn
    begin
      @api ||= Eve::API.new(:key_id => self.key_id, :v_code => self.v_code)
      # Errors will be raised once this method is triggered , but aside from that
      # this call is not meant for anything else.
      @api.account.characters
    rescue Eve::Errors::AuthenticationError
      return false
    end
    @api
  end

  def fetch_characters
    @api ||= get_api_conn
    @api.account.characters.rowsets.first if @api
  end
    
  def update_character_list
    fetch_characters.each do |char|
      characters.create({
        :name => char.name,
        :character_id => char.character_id,
        :corporation_name => char.corporation_name,
        :corporation_id => char.corporation_id
      })
    end unless fetch_characters.nil?
  end
  
  
  
end
