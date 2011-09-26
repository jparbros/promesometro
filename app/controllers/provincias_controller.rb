class ProvinciasController < ApplicationController
  def index
    state = State.find_by_name(params[:estado])
    render :json => state.provinces
  end
end