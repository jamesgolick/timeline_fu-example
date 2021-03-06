class Relationship < ActiveRecord::Base
  belongs_to :person
  belongs_to :friend, :class_name => "Person"

  validates_presence_of :person_id, :friend_id
  attr_accessible :person, :friend

  fires :friended, :on => :create, :actor => :person, :subject => :friend, :secondary_subject => :self
  fires :unfriended, :on => :destroy, :actor => :person, :subject => :friend, :secondary_subject => :self

  named_scope :after, lambda {|cutoff_at| {:conditions => {:created_at => (cutoff_at.utc .. Time.now.utc)}}}
end
