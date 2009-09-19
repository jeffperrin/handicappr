class AddPlayedOnAndCourseToRound < ActiveRecord::Migration
  def self.up
    add_column :rounds, :played_on, :date
    add_column :rounds, :course, :string
  end

  def self.down
    remove_column :rounds, :played_on
    remove_column :rounds, :course
  end
end
