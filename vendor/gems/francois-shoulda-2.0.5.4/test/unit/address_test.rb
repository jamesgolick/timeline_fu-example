require File.dirname(__FILE__) + '/../test_helper'

class AddressTest < Test::Unit::TestCase
  fixtures :all

  should_belong_to :addressable
  should_require_unique_attributes :title, :scoped_to => [:addressable_id, :addressable_type]
  should_ensure_length_at_least :zip, 5
  should_only_allow_numeric_values_for :zip

  context "A non-numeric zip" do
    setup do
      @address = Address.new(:zip => "bc")
    end

    should "be invalid" do
      assert_invalid @address
    end
  end

  context "A numeric zip" do
    setup do
      @address = Address.new(:zip => "90210")
    end

    should_fail do
      should "NOT be invalid" do
        assert_invalid @address
      end
    end
  end
end
