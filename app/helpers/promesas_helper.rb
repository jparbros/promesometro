module PromesasHelper
  
  def link_to_official(official)
    case official.position
    when 0
      link_to('Perfil del ' + official.position_name, alcalde_path(official))
    when 1
      link_to('Perfil del ' + official.position_name, presidentes_regionale_path(official))
    end
  end
  
  def promesa_started_in_words(promise)
    concat(content_tag('h3', 'Iniciado hace' + time_ago_in_words(promise.started_at) )) if promise.started_at
  end
end
