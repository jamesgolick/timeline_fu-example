class Person < ActiveRecord::Base
  validates_presence_of :name
  attr_accessible :name

  has_many :relationships
  has_many :friends, :through => :relationships

  def recent_events
    []
  end
end
