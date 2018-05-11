class InsertTransomHeights < ActiveRecord::Migration
  def self.up

    row = TransomHeight.create(:title => '15" (381 мм)', :slug => "S")
    row.save

    row = TransomHeight.create(:title => '20" (508 мм)', :slug => "L")
    row.save

    row = TransomHeight.create(:title => '25" (635 мм)', :slug => "XL")
    row.save

    row = TransomHeight.create(:title => '30" (762 мм)', :slug => "UL")
    row.save

  end

  def self.down
  end
end
