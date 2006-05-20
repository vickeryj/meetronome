require 'money'
class Meeting < ActiveRecord::Base
has_many :periods
composed_of :cost_per_hour, :class_name => "Money", :mapping => [%w(cents_per_hour cents), %w(currency currency)]


def start
  periods << Period.new
  #not sure if the save is needed?
  save
  periods.last
end

def stop
  periods.last.stopped_at = Time.now
  save
  periods.last
end

def running?
  periods.last.stopped_at.nil?
end

def paused?
  !running?
end

end
