class CreateMeetings < ActiveRecord::Migration
  def self.up
    create_table :meetings do |t|
       t.column :name, :string
       t.column :cents_per_hour, :integer
       t.column :currency, :string
    end
  end

  def self.down
    drop_table :meetings
  end
end
