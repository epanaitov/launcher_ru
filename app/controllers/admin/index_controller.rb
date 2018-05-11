class Admin::IndexController < AdminController


  def index
    @hulls = Hull.all :conditions => 'original_id IS NULL', :order => 'created_at DESC'

    @manufacturers = Manufacturer.all
  end

end
