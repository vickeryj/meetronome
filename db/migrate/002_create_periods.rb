class CreatePeriods < ActiveRecord::Migration
  def self.up
    create_table :periods do |t|
      t.column :meeting_id, :integer
      t.column :created_at, :datetime
      t.column :stopped_at, :datetime
      t.column :descr, :string
    end
  end

  def self.down
    drop_table :periods
  end
end
