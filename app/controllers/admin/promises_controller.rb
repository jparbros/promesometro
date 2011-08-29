class Admin::PromisesController < Admin::BaseController
  
  before_filter :get_official
  
  def index
    @promises = @official.promises
  end
  
  def new
    @promise = @official.promises.build
    @promise.milestones.build
    @topics = Topic.all
  end
  
  def create
    @promise = @official.promises.new(params[:promise])
    if @promise.save
      redirect_to admin_official_promises_url(@official), :notice => 'Promesa creada exitosamente'
    else
      render :new
    end
  end
  
  def edit
    @promise = @official.promises.find(params[:id])
    @promise.milestones.build if @promise.milestones.empty?
    @topics = Topic.all
  end
  
  def update
    params[:promise][:topic_ids] ||= []
    @promise = @official.promises.find(params[:id])
    if @promise.update_attributes(params[:promise])
      redirect_to admin_official_promises_url(@official), :notice => 'Promesa editada exitosamente'
    else
      render :edit
    end
  end
  
  def show
    @promise = @official.promises.find(params[:id])
  end
  
  def get_official
    @official = Official.find(params[:official_id])
  end
end
