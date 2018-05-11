class Hull < ActiveRecord::Base
  has_and_belongs_to_many :properties
  has_and_belongs_to_many :manufacturers

  has_many :changes, :class_name => "Hull", :foreign_key => "original_id"
  belongs_to :original, :class_name => "Hull"

  has_many :images

  validates_length_of :name, :minimum => 3
  validate :name_to_slug

  before_save :before_save

  def name_to_slug

    slug = name.to_slug

    if self[:original_id].nil?
      #this hull is new
      found = Hull.find_by_slug slug
      if not found.nil? and found[:id] != self[:id]
        errors.add :slug, 
          'Корпус с таким названием уже есть: <a href="/hulls/' + slug + '/">' + found[:name] + '</a>'
      end
    end

  end

  def before_save
    self.slug = name.to_slug

  end

end
