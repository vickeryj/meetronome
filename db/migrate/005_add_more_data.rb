class AddMoreData < ActiveRecord::Migration
  def self.up
    add_column :meetings, :attendance, :integer
    add_column :alt_widgets, :views, :integer
  end

  def self.down
    remove_column :meetings, :attendance
    remove_column :alt_widgets, :views
  end
end
