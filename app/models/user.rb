class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :events, :foreign_key => :creator_id
  has_many :attended_events, through: :attendings
  has_many :attendings, :foreign_key => :attendee_id


  def attending?(event)
    event.attendees.include?(self)
  end

  def attend!(event)
    self.attendings.create!(attended_event_id: event.id)
  end

  def cancel!(event)
    self.attendings.find_by(attended_event_id: event.id).destroy
  end
end
