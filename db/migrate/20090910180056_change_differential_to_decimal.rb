class ChangeDifferentialToDecimal < ActiveRecord::Migration
  def self.up
    change_column :rounds, 'differential', :decimal
  end

  def self.down
    change_column :rounds, 'differential', :integer
  end
end
