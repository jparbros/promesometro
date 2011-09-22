module PromesasHelper
  
  def link_to_official(official, text = nil)
    case official.position
    when 0
      link_to( text.nil? ? "Perfil del #{official.position_name}" : text , alcalde_path(official))
    when 1
      link_to( text.nil? ? "Perfil del #{official.position_name}" : text , presidentes_regionale_path(official))
    end
  end
  
  def promesa_state(promise)
    "Finalizado" if promise.finished?
    "En Progreso" if promise.started?
    "No Iniciado" if promise.not_started?
  end
  
  def titulo_filtro_promesas(filtro)
    concat ' - ' +  filtro['topics_name_equals'].humanize if filtro.include? 'topics_name_equals'
  end
  
  def hito_actual(promesa)
    case promesa.milestones.completed.size
      when 0 then 'hito_1_azul.png'  
      when 1 then 'hito_2_azul.png'
      when 2 then 'hito_3_azul.png'
      when 3 then 'hito_4_azul.png'
      when 4 then 'hito_5_azul.png'
      when 5 then 'hito_5_azul.png'
    end
  end
end
