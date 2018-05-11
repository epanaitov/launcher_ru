class Admin::ManufacturersController < AdminController
  def show
    @mfg = Manufacturer.find(params[:id])
  end

  def save

    @mfg = Manufacturer.find params[:manufacturer][:id]
    if @mfg.update_attributes params[:manufacturer]
      redirect_to '/admin/index/index'
    end
  end


end
