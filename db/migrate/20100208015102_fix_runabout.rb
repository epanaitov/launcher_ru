class FixRunabout < ActiveRecord::Migration
  def self.up
    dt = DeckType.find_by_slug 'ranabout'
    dt[:slug] = 'runabout'
    dt.save
  end

  def self.down
  end
end
