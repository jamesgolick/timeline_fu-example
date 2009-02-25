class Person < ActiveRecord::Base
  validates_presence_of :name
  attr_accessible :name

  has_many :relationships
  has_many :friends, :through => :relationships
  has_many :events, :class_name => "TimelineEvent", :as => :actor
end
