class CreateHullsManufacturers < ActiveRecord::Migration
  def self.up
    create_table :hulls_manufacturers, :id => false do |t|
      t.references :hull
      t.references :manufacturer
    end
  end

  def self.down
  end
end
