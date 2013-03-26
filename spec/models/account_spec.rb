require 'spec_helper'
require 'pp'

describe Account do

  describe "validations" do

    it { should validate_presence_of :key_id }
    it { should validate_presence_of :v_code }
    it { should validate_uniqueness_of :key_id }
    it { should validate_uniqueness_of :v_code }

    # it "can detect if auth keys are working" do
    #   a = build(:account, :key_id => "123434", :v_code => "failv_code")
    #   a.is_working_auth_key?.should_not be_true
    # end

    # USE WEB MOCK TO STUB OUT HTTP RESPONSES
    it "requires a working key_id and v_code" do
      # a = mock_service('account','characters', {:key_id => $key_id, :v_code => $v_code})

      # a = mock_service('account','server_status')
      # pp a.server_status
      # b = Eve::API.new()
      # b.server_status
      # a = build(:account, :key_id => $key_id, :v_code => $v_code)
      # a.is_working_auth_key?.should be_true
    end
  end

  context "Using a working key_id and v_code" do

    before(:each) do
      # @account = Account.new(valid_attributes)
      # @api ||= Eve::API.new(valid_attributes)
      # # Errors will be raised once this method is triggered , but aside from that
      # # this call is not meant for anything else.
      # @characters = @api.account.characters
    end

    # it "saves character information when the account record is saved" do
    #   chars_count = @characters.rowsets.first.length
    #   @account.save
    #   @account.characters.length.should > 0
    #   @account.characters.length.should be_eql(chars_count)
    # end

    # it "gets a working api object for child documents' use" do
    #   a = Account.new(valid_attributes)
    #   a.get_api_conn.class.should be_eql Eve::API
    # end

  end

end
