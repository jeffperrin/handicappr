class SetDecimalScaleAndPrecisionOnDifferential < ActiveRecord::Migration
  def self.up
    change_column :rounds, 'differential', :decimal, :precision => 6, :scale => 1
  end

  def self.down
  end
end
