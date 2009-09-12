class AddDifferentialToRound < ActiveRecord::Migration
  def self.up
    add_column :rounds, :differential, :integer
  end

  def self.down
    remove_column :rounds, :differential
  end
end
