require 'test_helper'

class RelationshipTest < ActiveSupport::TestCase
  should_have_valid_fixtures
  should_require_attributes :friend_id, :person_id
  should_allow_mass_assignment_of :friend, :person
  should_not_allow_mass_assignment_of :friend_id, :person_id

  should_belong_to :person, :friend

  context "Adding another person as a friend" do
    setup do
      @francois = people(:francois)
      @james    = people(:james)
      @francois.friends << @james
    end

    should_change "TimelineEvent.count", :by => 1

    context "the timeline event" do
      setup do
        @event = TimelineEvent.last
      end

      should "set the actor to be the person who created the friendship" do
        assert_equal @francois, @event.actor
      end

      should "set the subject to the new friend" do
        assert_equal @james, @event.subject
      end

      should "set the secondary subject to the relationship" do
        assert_equal @francois.relationships.first, @event.secondary_subject
      end

      should "set the event type to 'friended'" do
        assert_equal "friended", @event.event_type
      end
    end
  end

  context "Deleting the relationship" do
    setup do
      relationships(:james_to_francois).destroy
    end

    should_change "TimelineEvent.count", :by => 1

    context "the timeline event" do
      setup do
        @event = TimelineEvent.last
      end

      should "set the actor to the person who destroyed the friendship" do
        assert_equal people(:james), @event.actor
      end

      should "set the subject to the old fiend" do
        assert_equal people(:francois), @event.subject
      end

      should "set the secondary subject to the relationship" do
        # It's been deleted...  Oops!
      end

      should "set the event type to 'unfriended'" do
        assert_equal "unfriended", @event.event_type
      end
    end
  end
end
