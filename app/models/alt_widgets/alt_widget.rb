# == Schema Information
# Schema version: 8
#
# Table name: alt_widgets
#
#  id           :integer(11)   not null, primary key
#  name         :string(255)   
#  title        :string(255)   
#  calc         :text          
#  last_used_at :datetime      
#  views        :integer(11)   
#  data         :text          
#

class AltWidget < ActiveRecord::Base
  serialize :data

  def render(meeting, page, tag)
  end

  #def render_with_accounting(meeting, page, tag)
  #  self.last_used_at = DateTime.now
  #  self.views = 1 + (self.views || 0)
  #  self.save!
  #  #maybe set a popularity count or some kind of click through tracking?
  #  render_without_accounting(meeting, page, tag)
  #end

  #def after_find
  #  instance_eval(calc) unless calc.nil?
  #  sing = class << self; self; end
  #  sing.send :alias_method_chain, :render, :accounting
  #end
  
  def self.find_random
    #from jonathan viney
    #http://dev.rubyonrails.org/ticket/1384
    find(connection.select_value('select id from alt_widgets order by rand() limit 1'))
  end
end
