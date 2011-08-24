class Admin::OfficialsController < Admin::BaseController
  
  def index
    @officials = Official.all
  end
  
  def new
    @official = Official.new
    @positions = Official::POSITIONS.collect {|position| [position, Official::POSITIONS.index(position)]}
  end
  
  def create
    @official = Official.new(params[:official])
    if @official.save
      redirect_to admin_officials_url, :notice => "Funcionario creado exitosamente"
    else
      @positions = Official::POSITIONS.collect {|position| [position, Official::POSITIONS.index(position)]}
      render :new
    end
  end
end
