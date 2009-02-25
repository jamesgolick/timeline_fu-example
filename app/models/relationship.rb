class Relationship < ActiveRecord::Base
  belongs_to :person
  belongs_to :friend, :class_name => "Person"

  validates_presence_of :person_id, :friend_id
  attr_accessible :person, :friend

  fires :friended, :on => :create, :actor => :person
end
