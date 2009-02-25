require 'test_helper'

class RelationshipTest < ActiveSupport::TestCase
  should_have_valid_fixtures
  should_require_attributes :friend_id, :person_id
  should_allow_mass_assignment_of :friend, :person
  should_not_allow_mass_assignment_of :friend_id, :person_id

  should_belong_to :person, :friend
end
