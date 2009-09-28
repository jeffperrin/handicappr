class AddFullnameLocationHomepageToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :full_name, :string
    add_column :users, :location, :string
    add_column :users, :home_page, :string
  end

  def self.down
    remove_column :users, :full_name
    remove_column :users, :location
    remove_column :users, :home_page
  end
end
