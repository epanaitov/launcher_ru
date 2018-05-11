class AdminController < ApplicationController
  LOGIN, PASSWORD = 'rnixon', '1qa2ws'
  before_filter :authenticate, :prepare_layout
  
  layout 'admin'

  def index
    redirect_to '/admin/index'
  end

  private
    def authenticate
      authenticate_or_request_with_http_basic do |login, password|
        login == LOGIN && password == PASSWORD
      end
    end

    def prepare_layout
      @search_params = {}
      @search_params[:transom_height] = TransomHeight.all(:order => "title ASC")
      @search_params[:material] = Material.all
      @search_params[:deck_type] = DeckType.all
      @search_params[:mover_type] = MoverType.all
      @search_params[:manufacturer] = Manufacturer.all
    end

end
