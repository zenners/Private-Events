class Event < ActiveRecord::Base
	belongs_to :creator, :class_name => 'User'
	has_many :attendees, through: :attendings,  source:  :attendee
	has_many :attendings, :foreign_key => :attended_event_id

	scope	   :upcoming,    -> { where('date >= ?', DateTime.now).order('Date ASC') }
	scope      :past,        -> { where('date < ?', DateTime.now).order('Date DESC') }

end
