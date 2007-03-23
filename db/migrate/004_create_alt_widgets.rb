class CreateAltWidgets < ActiveRecord::Migration
  def self.up
    create_table :alt_widgets do |t|
      t.column :name, :string
      t.column :title, :string
      t.column :calc, :string
      t.column :last_used_at, :datetime
    end
  end

  def self.down
    drop_table :alt_widgets
  end
end
