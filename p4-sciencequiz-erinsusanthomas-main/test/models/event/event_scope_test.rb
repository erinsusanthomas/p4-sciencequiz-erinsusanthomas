require "test_helper"

class EventScopeTest < ActiveSupport::TestCase
  # Context
  context "Given context" do
    setup do 
      create_organizations
      create_events
    end

    should "list active events" do
      assert_equal 4, Event.active.count
      assert_equal [@acac_e1, @acac_e2, @acac_e3, @millvale_e1], Event.active
    end

    should "list inactive events" do
      assert_equal 1, Event.inactive.count
      assert_equal [@sq_e1], Event.inactive
    end
    
    should "list events chronologically" do
      assert_equal [@acac_e2, @millvale_e1, @acac_e3, @acac_e1, @sq_e1], Event.chronological
    end

    should "list past events" do
      assert_equal 4, Event.past.count
      assert_equal [@acac_e1, @acac_e2, @acac_e3, @millvale_e1], Event.past
    end

    should "list upcoming events" do
      assert_equal 1, Event.upcoming.count
      assert_equal [@sq_e1], Event.upcoming
    end

    should "list events for a given organization" do
      assert_equal 3, Event.for_organization(@acac).count
      assert_equal [@acac_e1, @acac_e2, @acac_e3], Event.for_organization(@acac)
      assert_equal 1, Event.for_organization(@millvale).count
      assert_equal [@millvale_e1], Event.for_organization(@millvale)
    end

    should "have a make_active method" do
      deny @sq_e1.active
      @sq_e1.make_active
      @sq_e1.reload
      assert @sq_e1.active
    end

    should "have a make_inactive method" do
      assert @acac_e1.active
      @acac_e1.make_inactive
      @acac_e1.reload
      deny @acac_e1.active
    end
  end
end