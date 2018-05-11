class AddHullStatus < ActiveRecord::Migration
  def self.up
    add_column :hulls, :original_id, :integer
  end

  def self.down
  end
end
