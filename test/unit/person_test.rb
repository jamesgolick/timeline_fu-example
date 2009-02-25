require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  should_have_valid_fixtures
  should_require_attributes :name
  should_allow_mass_assignment_of :name
  should_not_allow_mass_assignment_of :relationships, :friends, :relationship_ids, :friend_ids
  should_have_many :relationships
  should_have_many :friends

  context "A new person" do
    setup do
      @person = Person.create!(:name => "Mat")
    end

    should "have an empty #recent_events feed" do
      assert @person.recent_events.empty?
    end
  end
end
