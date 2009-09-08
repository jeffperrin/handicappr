class ClearanceUpdateUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :name, :string
    add_column :users, :twitter, :string
  end

  def self.down
    remove_column :users, :name
    remove_column :users, :twitter
  end
end
