class CreateNotes < ActiveRecord::Migration
  def self.up
    create_table :notes do |t|
      t.column :meeting_id, :integer
      t.column :created_at, :datetime
      t.column :stopped_at, :datetime
      t.column :descr, :string
    end
  end

  def self.down
    drop_table :notes
  end
end
