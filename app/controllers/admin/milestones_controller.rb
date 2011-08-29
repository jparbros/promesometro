class Admin::MilestonesController < Admin::BaseController
  
  before_filter :get_official
  has_many :notes, :polymorphic => true
  
  def index
    @official = Official.find(params[:official_id])
    @promises = @official.promises
  end
end
