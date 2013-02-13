require 'spec_helper'
require 'pp'
shared_context "shared account attributes" do
  before :all do
    @valid_attributes = {
        :key_id => $key_id,
        :v_code => $v_code
    }
  end
end

describe Account do

  describe "validations" do
    include_context "shared account attributes"
    
    it { should validate_presence_of :key_id }
    it { should validate_presence_of :v_code }
    it { should validate_uniqueness_of :key_id }
    it { should validate_uniqueness_of :v_code }

    it "can detect if auth keys are working" do
      a = Account.new(:key_id => "123434", :v_code => "failv_code")
      a.is_working_auth_key?.should_not be_true
    end

    it "requires a working key_id and v_code" do
      a = Account.new(@valid_attributes)
      a.is_working_auth_key?.should be_true
    end
  end

  context "Using a working key_id and v_code" do
    include_context "shared account attributes"
    before(:each) do
      @account = Account.new(@valid_attributes)
      @api ||= Eve::API.new(@valid_attributes)
      # Errors will be raised once this method is triggered , but aside from that
      # this call is not meant for anything else.
      @characters = @api.account.characters
    end

    it "saves character information when the account record is saved" do
      chars_count = @characters.rowsets.first.length
      @account.save
      @account.characters.length.should > 0
      @account.characters.length.should be_eql(chars_count)
    end

    it "gets a working api object for child documents' use" do
      a = Account.new(@valid_attributes)
      a.get_api_conn.class.should be_eql Eve::API
    end

  end

end
