class CreateMoverTypes < ActiveRecord::Migration
  def self.up
    row = MoverType.create(:title => "Подвесной", :slug => "outboard")
    row.save

    row = MoverType.create(:title => "Водомет", :slug => "jet")
    row.save

    row = MoverType.create(:title => "Валовый или ПОК", :slug => "inboard")
    row.save
  end

  def self.down
  end
end
