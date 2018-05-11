class Manufacturer < ActiveRecord::Base
  has_and_belongs_to_many :hulls, :conditions => "reviewed = 1"

  before_save :before_save

  def before_save
    self.slug = self.name.to_slug
  end
end
