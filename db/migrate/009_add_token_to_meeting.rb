class AddTokenToMeeting < ActiveRecord::Migration
  def self.up
    add_column :meetings, :token, :string  
  end

  def self.down
    remove_column :meetings, :token  
  end
end
