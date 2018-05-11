class MainController < ApplicationController
  layout 'main'

  before_filter :prepare_layout

  def prepare_layout
    @search_params = {}
    @search_params[:transom_height] = TransomHeight.all(:order => "title ASC")
    @search_params[:material] = Material.all
    @search_params[:deck_type] = DeckType.all
    @search_params[:mover_type] = MoverType.all
    @search_params[:manufacturer] = Manufacturer.find_by_sql("
      SELECT mfg.name, mfg.slug, count(hm.hull_id) as hc FROM manufacturers mfg
      JOIN hulls_manufacturers hm ON mfg.id = hm.manufacturer_id
			JOIN hulls h ON h.id = hm.hull_id
			WHERE h.reviewed = 1
      GROUP BY mfg.id HAVING hc > 0 ORDER BY hc DESC")
  end

end
