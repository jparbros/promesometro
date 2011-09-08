class Admin::MilestoneStateController < ApplicationController
  def create
    @milestone = Milestone.find(params[:milestone_id])
    message = @milestone.start! ? {:notice => 'Hito iniciado'} : {:error => 'Ocurrio un problema al iniciar el hito'}
    redirect_to admin_official_promise_url(@milestone.promise.official, @milestone.promise), message
  end
  
  def update
    @milestone = Milestone.find(params[:milestone_id])
    message = @milestone.finish! ? {:notice => 'Hito finalizado'} : {:error => 'Ocurrio un problema al iniciar el hito'}
    redirect_to admin_official_promise_url(@milestone.promise.official, @milestone.promise), message
  end
end
