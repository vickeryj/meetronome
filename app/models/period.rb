# == Schema Information
# Schema version: 4
#
# Table name: periods
#
#  id         :integer(11)   not null, primary key
#  meeting_id :integer(11)   
#  created_at :datetime      
#  stopped_at :datetime      
#  descr      :string(255)   
#

class Period < ActiveRecord::Base
  belongs_to  :meeting
end
