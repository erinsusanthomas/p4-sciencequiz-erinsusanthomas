require "test_helper"

class UserScopeTest < ActiveSupport::TestCase

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

    should "list users alphabetically" do
      assert_equal ["Cindy", "Megan", "Alex", "Kathryn", "Sophie", "Ben", "Chuck", "Ralph"], User.alphabetical.map{|u| u.first_name}
    end

    should "list active users" do
      assert_equal 7, User.active.count
      assert_equal ["Alex", "Ben", "Cindy", "Kathryn", "Megan", "Ralph", "Sophie"], User.active.map{|u| u.first_name}.sort
      assert_equal [@alex, @ben, @cindy, @kathryn, @ed, @ralph, @sophie], User.active.sort_by{|u| u.first_name}
    end

    should "list inactive users" do
      assert_equal 1, User.inactive.count
      assert_equal [@chuck], User.inactive
    end

  end

end