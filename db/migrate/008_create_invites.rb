class CreateInvites < ActiveRecord::Migration
  def self.up
    create_table :invites do |t|
      t.column :message, :string
      t.column :inviter_user_id, :integer
      t.column :accepter_user_id, :integer
      t.column :token, :string
    end
  end

  def self.down
    drop_table :invites
  end
end
