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
  
  def hito_imagen(hito, promesa)
    hito_actual = promesa.milestones.completed.size
    if (hito == hito_actual) || (hito == 1 && hito_actual == 0)
      milestone = promesa.milestones[hito-1]
      content = []
      content << image_tag("hito_#{hito}_azul.png")
      container = []
      div1 = []
      div1 << content_tag('span', 'Tiempo transcurrido', :class => 'etiqueta')
      div1 << tag(:br)
      div1 << content_tag('span', milestone.days_started.to_s + " dias", :class => 'estado')
      container << content_tag(:div, raw(div1.join), :class => 'tiempo_hito')
      div2 = []
      div2 << content_tag('span', 'Status', :class => 'etiqueta')
      div2 << tag(:br)
      div2 << content_tag('span', milestone.state_scaped.upcase, :class => 'estado')
      container << content_tag(:div, raw(div2.join), :class => 'estado_hito')
      content << content_tag(:div, raw(container.join), :class => 'hito_status')
      concat raw(content.join(''))
    else
      concat(image_tag("hito_#{hito}_gris.png"))
    end
  end
  
  def comentarios_count(promesa)
    concat(content_tag(:span, promesa.comments.available_comments.count.to_s + " Comentarios", :class => 'comentarios_counter'))
  end
  
  def promesas_temas(promesa)
    concat 'Promesa de ' + promesa.topics.collect {|topic| topic.name}.join(', ')
  end
end
