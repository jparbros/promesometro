class Admin::TopicsController < Admin::BaseController

  def index
    @search = Topic.search(params[:search])
    @topics = params[:all]? Topic.all : @search.page(params[:page])
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(params[:topic])
    if @topic.save
      redirect_to admin_topics_url, :notice => 'Tema creado exitosamente'
    else
      render :new
    end
  end

  def edit
    @topic = Topic.find(params[:id])
  end
  
  def update
    @topic = Topic.find(params[:id])
    if @topic.update_attributes(params[:topic])
      redirect_to admin_topics_url, :notice => 'Tema editado exitosamente'
    else
      render :edit
    end
  end
  
  def sort
    Topic.update_sort(params[:topic])
    render :nothing => true
  end
end
