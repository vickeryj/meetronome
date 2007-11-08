# == Schema Information
# Schema version: 8
#
# Table name: meetings
#
#  id             :integer(11)   not null, primary key
#  name           :string(255)   
#  cents_per_hour :integer(11)   
#  currency       :string(255)   
#  attendance     :integer(11)   
#  owner_cookie   :string(255)   
#

require 'money'
class Meeting < ActiveRecord::Base
has_many :periods
has_many :notes, :order => "created_at desc"
composed_of :cost_per_hour, :class_name => "Money", :mapping => [%w(cents_per_hour cents), %w(currency currency)]


def start
  period = Period.new
  periods << period
  period
end

def stop

  stop_notes
  period = periods.last
  #dont restop a stopped meeting
  if period.stopped_at.nil? 
    period.stopped_at = Time.now
    period.save
  end
end

def stop_notes
  notes.each {|n|
    if n.running?
      n.stop()
    end
  }
end

def running?
  periods.last.stopped_at.nil?
end

#can we delete this one? -p
def paused?
  !running?
end

def stopped?
  !running?
end

def stopped_at
  periods.last.stopped_at
end

def time_in_seconds
  @total_time = 0
  periods.each {
    |p|
    if not p.stopped_at.nil?
      @total_time +=  (p.stopped_at - p.created_at )
    else
      @total_time += (Time.now - p.created_at)
    end
  }
  @total_time
end

def cost
  (time_in_seconds * cents_per_hour / 3600).round
end

def dollars_per_hour=(dollars)
  write_attribute(:cents_per_hour, (dollars.to_f*100).round)
end

def dollars_per_hour
  read_attribute(cents_per_hour) ? read_attribute(cents_per_hour)/100 : nil
end

def changed_in_minute?
  notes.each do |note|
    return true if note.changed_in_minute?
  end
end

##
# validation
##
validates_presence_of :name
validates_numericality_of :cents_per_hour

end
