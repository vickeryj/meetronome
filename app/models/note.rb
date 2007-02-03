# == Schema Information
# Schema version: 3
#
# Table name: notes
#
#  id         :integer(11)   not null, primary key
#  meeting_id :integer(11)   
#  created_at :datetime      
#  stopped_at :datetime      
#  descr      :string(255)   
#

class Note < ActiveRecord::Base
  belongs_to :meeting

  def time_in_seconds
    if running?
      return Time.now - created_at
    else
      return stopped_at - created_at
    end
  end

  def cost
    (time_in_seconds * meeting.cents_per_hour / 3600).round
  end

  def stop
    if running?
      write_attribute(:stopped_at,Time.now)
      save
    end
  end

  def running?
    stopped_at.nil?
  end

end
