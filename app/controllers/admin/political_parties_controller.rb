class Admin::PoliticalPartiesController < Admin::BaseController
  
  def index
    @search = PoliticalParty.search(params[:search])
    @political_parties = @search.page(params[:page])
  end
  
  def new
    @political_party = PoliticalParty.new
  end
  
  def create
    @political_party = PoliticalParty.new(params[:political_party])
    if @political_party.save
      redirect_to admin_political_parties_url, :notice => "Partido Politico creado exitosamente"
    else
      render :new
    end
  end
  
  def edit
    @political_party = PoliticalParty.find(params[:id])
  end
  
  def update
    @political_party = PoliticalParty.find(params[:id])
    if @political_party.update_attributes(params[:political_party])
      redirect_to admin_political_parties_url, :notice => "Partido Politico editado exitosamente"
    else
      render :edit
    end
  end
end
