# == Schema Information
# Schema version: 8
#
# Table name: invites
#
#  id               :integer(11)   not null, primary key
#  message          :string(255)   
#  inviter_user_id  :integer(11)   
#  accepter_user_id :integer(11)   
#  token            :string(255)   
#

class Invite < ActiveRecord::Base
  include TokenGenerator
  before_create :set_token
  
  belongs_to :inviter_user, :class => 'User', :foreign_key => 'inviter_user_id'
  belongs_to :accepter_user, :class => 'User', :foreign_key => 'accepter_user_id'
  
  
end
