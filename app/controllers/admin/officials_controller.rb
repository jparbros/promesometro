class Admin::OfficialsController < Admin::BaseController
  
  def index
    @officials = Official.all
  end
  
  def new
    @official = Official.new
  end
  
  def create
    @official = Official.new(params[:official])
    if @official.save
      redirect_to admin_officials_url, :notice => "Funcionario creado exitosamente"
    else
      render :new
    end
  end
  
  def create
    @official = Official.find(params[:id])
    if @official.update_attributes(params[:official])
      redirect_to admin_officials_url, :notice => "Funcionario editado exitosamente"
    else
      render :edit
    end
  end
  
  def edit
    @official = Official.find(params[:id])
    @positions = Official::POSITIONS.collect {|position| [position, Official::POSITIONS.index(position)]}
  end
end
