require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  should_have_valid_fixtures
  should_require_attributes :name
  should_allow_mass_assignment_of :name
  should_not_allow_mass_assignment_of :created_at, :updated_at
  should_have_many :relationships
  should_have_many :friends
end
