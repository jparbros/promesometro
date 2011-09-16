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
    concat(content_tag('h3', "Finalizado en #{distance_of_time_in_words(promise.started_at,promise.ended_at)}")) if promise.finished?
    concat(content_tag('h3', "Iniciado hace #{time_ago_in_words(promise.started_at)}")) if promise.started?
    concat(content_tag('h3', "No Iniciado")) if promise.not_started?
  end
  
  def titulo_filtro_promesas(filtro)
    concat ' - ' +  filtro['topics_name_equals'].humanize if filtro.include? 'topics_name_equals'
  end
end
