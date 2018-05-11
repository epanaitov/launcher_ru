class Admin::HullsController < AdminController

  def show
    @hull = Hull.find params[:id], :include => [:manufacturers, :properties]
    @hull.properties.each do |prop|
      @hull[prop[:type].underscore] = prop[:id]
    end
  end

  def save
    id = params['hull']['id']
    hull = Hull.find id, :include => [:properties, :manufacturers]

    params[:material] = params[:hull][:material]
    params[:hull].delete(:material)

    params[:mover_type] = params[:hull][:mover_type]
    params[:hull].delete(:mover_type)

    params[:deck_type] = params[:hull][:deck_type]
    params[:hull].delete(:deck_type)

    params[:transom_height] = params[:hull][:transom_height]
    params[:hull].delete(:transom_height)

    hull.update_attributes(params['hull'])
    if hull.valid?
      unless params[:manufacturer].blank?
        mfg = params[:manufacturer].to_s.to_slug
        found = Manufacturer.find_by_slug mfg
        found = Manufacturer.new(:name => params[:manufacturer]) if found.nil?
        hull.manufacturers = [found]
      end

      material = Material.find params[:material]
      mover_type = MoverType.find params[:mover_type]
      deck_type = DeckType.find params[:deck_type]
      transom_height = TransomHeight.find params[:transom_height]
      hull.properties = [material, mover_type, deck_type, transom_height]

      hull[:reviewed] = 1
      hull.save
      redirect_to '/admin/index/index'
    else
      render :action => 'show', :id => id
    end
  end

  def delete
    Hull.delete params[:id]
    redirect_to '/admin/index/index'
  end

end
