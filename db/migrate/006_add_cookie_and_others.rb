class AddCookieAndOthers < ActiveRecord::Migration
  def self.up
    add_column :meetings, :owner_cookie, :string
    add_column :alt_widgets, :data, :text
    change_column :alt_widgets, :calc, :text
  end

  def self.down
    remove_column :meetings, :owner_cookie
    remove_column :alt_widgets, :data
    change_column :alt_widgets, :calc, :string
  end
end
