class HullAddReviewed < ActiveRecord::Migration
  def self.up
    add_column :hulls, :reviewed, :tinyint, :null => false, :default => 0
  end

  def self.down
  end
end
