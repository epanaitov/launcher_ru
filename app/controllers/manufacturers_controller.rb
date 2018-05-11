class ManufacturersController < MainController
  def show
    @mfg = Manufacturer.find_by_slug params[:id], :include => {:hulls => :properties}
    if @mfg.nil?
      flash[:error] = "Этого производителя еще нет в нашей базе."
      redirect_to '/'
    end

    @title = @mfg[:name] + ' - ' + @mfg.hulls[0..2].collect{|hull| hull[:name]}.join(', ')

    @keywords = @mfg[:name] + ', ' + @mfg.hulls[0..10].collect{|hull| hull[:name]}.join(', ')

    @description = 'Описание катеров и лодок производителя ' + @mfg[:name] + ': ' + @mfg.hulls[0..10].collect{|hull| hull[:name]}.join(', ')
    

  end

  def new
  end

  def create
  end

  def edit
  end

end
