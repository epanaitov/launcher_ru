class PatchImages < ActiveRecord::Migration
  def self.up
    remove_column :images, :for
    rename_column :images, :object_id, :hull_id
  end

  def self.down
  end
end
