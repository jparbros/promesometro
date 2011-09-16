module AlcaldesHelper
  def milestone_class(milestone)
    case milestone.state
    when 'new'
      'milestone_new'
    when 'in_progress'
      'milestone_started'
    when 'finished'
      'milestone_finished'
    end
  end
  
  def milestone_states(milestone)
    case milestone.state
    when 'new'
      'No Iniciado'
    when 'in_progress'
      "Iniciado hace #{started_at_in_words(milestone)}"
    when 'finished'
      "Finalizado en #{distance_of_time_in_words(milestone.started_at,milestone.ended_at)}"
    end
  end
  
  def name_to_function(name)
    name.gsub(' ','_')
  end
end
