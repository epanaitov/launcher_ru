class CreateManufacturers < ActiveRecord::Migration
  def self.up
    create_table :manufacturers, :options => "DEFAULT CHARSET=utf8" do |t|

      t.string :slug
      t.string :name
      t.string :url
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :manufacturers
  end
end
