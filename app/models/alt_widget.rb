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
  
  def render(meeting, page, tag)
  end

  def render_with_accounting(meeting, page, tag)
    last_used_at = DateTime.now
    self.save
    #maybe set a popularity count or some kind of click through tracking?
    render_without_accounting(meeting, page, tag)
  end

  def after_find
    instance_eval(calc) unless calc.nil?
    AltWidget.alias_method_chain :render, :accounting
  end
  
  def self.find_random
    #from jonathan viney
    #http://dev.rubyonrails.org/ticket/1384
    find(connection.select_value('select id from alt_widgets order by rand() limit 1'))
  end
end
