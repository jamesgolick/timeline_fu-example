class Person < ActiveRecord::Base
  validates_presence_of :name
  attr_accessible :name

  has_many :relationships
  has_many :friends, :through => :relationships

  RecentEventsCondition = '(subject_id = #{id} AND subject_type = \'Person\')
                          OR (actor_type = \'Person\' AND actor_id IN (SELECT friend_id FROM relationships WHERE relationships.person_id = #{id}))'
  has_many :recent_events,  :class_name => "TimelineEvent", :order => "timeline_events.created_at DESC",
                            :finder_sql => 'SELECT timeline_events.* FROM timeline_events
                                            WHERE ' + RecentEventsCondition + ' ORDER BY timeline_events.created_at DESC',
                            :counter_sql => 'SELECT COUNT(*) FROM timeline_events WHERE ' + RecentEventsCondition

  def to_s
    name
  end
end
