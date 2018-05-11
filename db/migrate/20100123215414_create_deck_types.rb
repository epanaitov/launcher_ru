class CreateDeckTypes < ActiveRecord::Migration
  def self.up
    row = DeckType.create(:title => 'Автомобильная компоновка', :slug => 'ranabout')
    row.save

    row = DeckType.create(:title => 'Каютный', :slug => 'cabin')
    row.save

    row = DeckType.create(:title => 'Хардтоп', :slug => 'hardtop')
    row.save

    row = DeckType.create(:title => 'Открытый', :slug => 'bowrider')
    row.save

    row = DeckType.create(:title => 'Каютный walkaround', :slug => 'cabin-walkaround')
    row.save

    row = DeckType.create(:title => 'Хардтоп walkaround', :slug => 'hardtop-walkaround')
    row.save
  end

  def self.down
  end
end
