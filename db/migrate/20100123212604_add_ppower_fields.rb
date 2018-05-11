class AddPpowerFields < ActiveRecord::Migration
  def self.up
    add_column :hulls, :power_min, :integer
    add_column :hulls, :power_max, :integer
  end

  def self.down
  end
end
