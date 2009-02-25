class Person < ActiveRecord::Base
  validates_presence_of :name
  attr_accessible :name

  has_many :relationships
  has_many :friends, :through => :relationships

  has_many :recent_events, :as => :subject, :class_name => "TimelineEvent", :order => "timeline_events.created_at DESC"
end
