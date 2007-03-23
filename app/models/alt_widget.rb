# == Schema Information
# Schema version: 4
#
# Table name: alt_widgets
#
#  id           :integer(11)   not null, primary key
#  name         :string(255)   
#  title        :string(255)   
#  calc         :string(255)   
#  last_used_at :datetime      
#

class AltWidget < ActiveRecord::Base
  #the calc field should contain the definition 
  #of calculate(meeting) for the alternative
  #the method needs to return html for now
  #we should probably change that with some 
  #helpers or something
  def after_find
    instance_eval(calc) unless calc.nil?
  end

  def calculate_alternative(meeting)
    last_used_at = DateTime.now
    self.save
    calculate(meeting)
  end
  
  def self.find_random
    #from jonathan viney
    #http://dev.rubyonrails.org/ticket/1384
    find(connection.select_values('select id from alt_widgets order by rand() limit 1'))
  end
end
