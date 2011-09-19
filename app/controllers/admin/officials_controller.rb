class Admin::OfficialsController < Admin::BaseController
  
  def index
    @search = Official.search(params[:search])
    @officials = @search.page(params[:page])
  end
  
  def new
    @official = Official.new
    @states = State.all.collect {|state| [state.name, state.id]}
    @provinces = []
  end
  
  def create
    @official = Official.new(params[:official])
    if @official.save
      redirect_to admin_officials_url, :notice => "Funcionario creado exitosamente"
    else
      render :new
    end
  end
  
  def update
    @official = Official.find(params[:id])
    if @official.update_attributes(params[:official])
      redirect_to admin_officials_url, :notice => "Funcionario editado exitosamente"
    else
      render :edit
    end
  end
  
  def edit
    @official = Official.find(params[:id])
    @states = State.all.collect {|state| [state.name, state.id]}
    @provinces = @official.state ?  @official.state.provinces.collect {|province| [province.name, province.id]} : []
  end
  
  def provinces
    states = State.find(params[:state_id])
    render :json => states.provinces
  end
end
