class CreateMaterials < ActiveRecord::Migration
  def self.up
    row = Material.create(:title => "Пластик", :slug => "fiberglass")
    row.save

    row = Material.create(:title => "Дюраль", :slug => "duralumin")
    row.save

    row = Material.create(:title => "АМГ", :slug => "5086")
    row.save

    row = Material.create(:title => "Комбинированный (пластиковая палуба, металлическое днище)", :slug => "combined")
    row.save

    row = Material.create(:title => "ПВХ (надувная)", :slug => "inflatible")
    row.save

    row = Material.create(:title => "РИБ", :slug => "rib")
    row.save
  end

  def self.down
  end
end
