class CreateHullsProperties < ActiveRecord::Migration
  def self.up
    create_table :hulls_properties, :id => false do |t|
      t.references :hull
      t.references :property
    end

  end

  def self.down
  end
end
