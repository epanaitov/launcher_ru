class CreateHullProperties < ActiveRecord::Migration
  def self.up
    create_table :properties, :options => "DEFAULT CHARSET=utf8" do |t|
      t.string :type
      t.string :slug
      t.string :title

      t.timestamps
    end
  end

  def self.down
    drop_table :properties
  end
end
