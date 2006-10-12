require 'money'
class Meeting < ActiveRecord::Base
has_many :periods
composed_of :cost_per_hour, :class_name => "Money", :mapping => [%w(cents_per_hour cents), %w(currency currency)]


def start
  period = Period.new
  periods << period
  period
end

def stop
  period = periods.last
  period.stopped_at = Time.now
  period.save
end

def running?
  periods.last.stopped_at.nil?
end

def paused?
  !running?
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

##
# validation
##
validates_presence_of :name
validates_numericality_of :cents_per_hour

end
