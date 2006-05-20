require 'money'
class Meeting < ActiveRecord::Base
composed_of :cost_per_hour, :class_name => "Money", :mapping => [%w(cents_per_hour cents), %w(currency currency)]

end
