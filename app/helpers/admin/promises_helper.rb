module Admin::PromisesHelper
  
  def milestone_state_button(milestone)
    case milestone.state
    when 'new'
      button_to 'Empezar Hito', admin_milestone_state_path(milestone), :class => 'btn'
    when 'in_progress'
      button_to 'Terminar Hito', admin_milestone_state_path(milestone), :method => :put, :class => 'btn'
    end
  end
  
  def started_at_in_words(milestone)
    concat 'hace ' + time_ago_in_words(milestone.started_at) if milestone.started_at and milestone.in_progress?
  end
end
