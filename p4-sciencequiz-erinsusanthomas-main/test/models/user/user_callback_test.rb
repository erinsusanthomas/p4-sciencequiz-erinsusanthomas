require "test_helper"

class UserCallbackTest < ActiveSupport::TestCase

  # Context
  context "Given context for user" do
    setup do 
      create_organizations
      create_users
    end
    teardown do
      destroy_users
      destroy_organizations
    end

    should "shows that phone number is reformatted" do
      assert_equal "4112234569", @ed.phone
      assert_equal "4122682323", @ben.phone
      assert_equal "4112234569", @chuck.phone
    end
    
  end
  
end