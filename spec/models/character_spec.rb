require 'spec_helper'

shared_context "shared character attributes" do
  before :all do
    @valid_account_attributes = {
        :key_id => $key_id,
        :v_code => $v_code
    }
    @account = Account.new(@valid_account_attributes)
    @account.save
  end
end

describe Character do

  include_context "shared character attributes"

  it "Requires a character name" do
    c = Character.new(:name => "", :character_id => $character_id)
    c.valid?.should_not be_true
  end

  it "Requires a character id" do
    c = Character.new(:name => "Theazy CS", :character_id => "")
    c.valid?.should_not be_true
  end

  context "Using a valid character record" do

    include_context "shared character attributes"

    before (:all) do 
      @char = @account.characters.first
    end

    it "Fetches character sheet information" do
      char_sheet = @char.fetch_character_sheet_information
      char_sheet.should_not be_nil
    end

    it "Retrieves character sheet information and save into the character record" do
      @char.fetch_and_save_character_sheet_information.should be_true
    end

    it "Saves the correct data into its respective database fields" do
      @char.fetch_and_save_character_sheet_information.should be_true
      char_sheet = @account.get_api_conn.character.character_sheet
      @char.fields.keys.each do |field| 
        if char_sheet.all_fields.include?(field)
          if @char.send(field).class == DateTime
            # converting DateTime objects to int
            # differences in date formatting is a bitch to compare.
            @char.send(field).utc.to_i.should be_eql char_sheet.send(field).utc.to_i
          else
            @char.send(field).to_s.should be_eql(char_sheet.send(field).to_s)
          end
        end
      end
    end

    it "retrieves character faction war stats and save it"
    it "Retrieves character medals and save it"
    it "Retrieves skill in training information and save it"
    it "Retrieves skill queue information and save it"
    it "Retrieves standings information and save it"
    it "Retrieves account balance information and save it"
    it "Retrieves assets list and save it"
    it "Retrieves industry jobs and save it"
    it "Retrieves kill logs information and save it"
    it "Retrieves mailing lists information and save it"
    it "Retrieves mail messages and save it"
    it "Retrieves market orders and save it"
    it "Retrieves notifications and save it"
    it "Retrieves research information and save it"
    it "Retrieves wallet journal information and save it"
    it "Retrieves journal entries and save it"
    it "Retrieves wallet transactions and save it"
  end

end
