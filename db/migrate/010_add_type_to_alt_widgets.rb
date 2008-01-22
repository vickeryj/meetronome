class AddTypeToAltWidgets < ActiveRecord::Migration
  def self.up
    add_column :alt_widgets, :type, :string  
  end

  def self.down
    remove_column :alt_widgets, :type  
  end
end
