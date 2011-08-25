class Admin::MilestonesController < Admin::BaseController
  
  before_filter :get_official
  
  def index
    @official = Official.find(params[:official_id])
    @promises = @official.promises
  end
end
