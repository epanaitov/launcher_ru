class CreateHulls < ActiveRecord::Migration
  def self.up
    create_table :hulls, :options => "DEFAULT CHARSET=utf8" do |t|

      t.string :name
      t.float :length
      t.float :width
      t.float :height
      t.integer :weight
      t.references :mover_type
      t.string :slug

      t.float :deadrise
      t.text :description
      t.text :configuration

      t.string :url
      t.integer :price

      t.timestamps
    end
  end

  def self.down
    drop_table :hulls
  end
end
