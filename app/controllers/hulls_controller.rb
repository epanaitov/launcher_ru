class HullsController < MainController

  def new

    @hull = Hull.new
    @hull[:material] = nil
    @hull[:deck_type] = nil
    @hull[:transom_height] = nil
    @hull[:mover_type] = nil
		
		session[:new_hull_form] = Time.now

  end

  def create
		
		if (Time.now - session[:new_hull_form]) < 11
			redirect_to :action => :new
			return
		end

    params[:material] = params[:hull][:material]
    params[:hull].delete(:material)

    params[:mover_type] = params[:hull][:mover_type]
    params[:hull].delete(:mover_type)

    params[:deck_type] = params[:hull][:deck_type]
    params[:hull].delete(:deck_type)

    params[:transom_height] = params[:hull][:transom_height]
    params[:hull].delete(:transom_height)

    @hull = Hull.new(params[:hull].fix_commas)

    if @hull.valid?

      unless params[:manufacturer].blank?
        mfg = params[:manufacturer].to_s.to_slug
        found = Manufacturer.find_by_slug mfg
        found = Manufacturer.new(:name => params[:manufacturer]) if found.nil?
        @hull.manufacturers << found
      end

      material = Material.find params[:material]
      @hull.properties << material

      mover_type = MoverType.find params[:mover_type]
      @hull.properties << mover_type

      deck_type = DeckType.find params[:deck_type]
      @hull.properties << deck_type

      transom_height = TransomHeight.find params[:transom_height]
      @hull.properties << transom_height

      @hull.save
      flash[:notice] = "Корпус успешно добавлен в базу, спасибо! Скоро мы его опубликуем."

			Mailer.deliver_contact_email("launcha@launcha.ru", "Был добавлен корпус " + params[:hull].fix_commas.to_s)

      redirect_to :action=> @hull[:slug]
    else
      render :action => :new
    end
    
  end

  def save

    if params.include? 'id' and params[:id] > 0
      @hull = Hull.find(params[:id])

      if (DateTime.now - @hull[:created_at]).min > 5
        params[:hull][:original_id] = @hull[:id]
        @hull = Hull.new
      end

    else
      @hull = Hull.new
    end

    @hull.update_attributes(params[:hull])

    if @hull.valid?
      redirect_to :action=> :show
    end

  end

  def show

    slug = params[:id]

    @hull = Hull.find_by_slug slug, :include => [:manufacturers, :properties, :images]

    if @hull.nil?
      flash[:error] = "Такого корпуса еще нет или страница была удалена."
      redirect_to '/'
    end

    @title = @hull[:name] + ' - ' + @hull.manufacturers.collect { |mfg| mfg[:name]}.join(', ')
    @keywords = @hull[:name] + ', ' + @hull.manufacturers.collect { |mfg| mfg[:name]}.join(', ')
    @description = 'Описание катеров и лодок ' + @hull[:name]
    if @hull.manufacturers.size > 0
      if @hull.manufacturers.size == 1
        @description+= ' производителя '
      else
        @description+= ' производителей '
      end
      @description+= @hull.manufacturers.collect { |mfg| mfg[:name]}.join(', ')
    end
  end

  def edit
  end

end
