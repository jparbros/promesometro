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
    concat content_tag(:h2, "Filtrado por tema: #{filtro['topics_name_contains'].humanize}") unless filtro['topics_name_contains'].blank?
    concat content_tag(:h2, "Busqueda por promesa: #{filtro['title_contains'].humanize}") unless filtro['title_contains'].blank?
    concat content_tag(:h2, "Busqueda por representante: #{filtro['official_name_contains'].humanize}") unless filtro['official_name_contains'].blank?
    concat content_tag(:h2, "Busqueda por region: #{filtro['official_state_name_contains'].humanize}") unless filtro['official_state_name_contains'].blank?
    concat content_tag(:h2, "Busqueda por partido politico: #{filtro['official_political_party_name_contains'].humanize}") unless filtro['official_political_party_name_contains'].blank?
    concat content_tag(:h2, "Busqueda por tema: #{filtro['topics_contains'].humanize}") unless filtro['topics_contains'].blank?
    concat content_tag(:h2, "Busqueda por dias de progreso: #{filtro['dias_progreso_contains'].humanize}") unless filtro['dias_progreso_contains'].blank?
  end
  
  def hito_actual(promesa)
    case promesa.milestones.completed.size
      when 0 then 'hito_1_rojo.png'  
      when 1 then 'hito_2_rojo.png'
      when 2 then 'hito_3_rojo.png'
      when 3 then 'hito_4_rojo.png'
      when 4 then 'hito_5_rojo.png'
      when 5 then 'hito_5_rojo.png'
    end
  end
  
  def hito_imagen(hito, promesa)
    hito_actual = promesa.milestones.completed.size
    milestone = promesa.milestones[hito-1]
    if hito <= promesa.milestones.size
      if (milestone.in_progress?) || (milestone.new? && promesa.milestones[hito-2].finished?) || (hito == 1 && hito_actual == 0)
        content = []
        content << image_tag("hito_#{hito}_rojo.png", :id => "hito-#{hito}", :title => "Hito #{hito} - #{milestone.started_at.to_s(:date) if milestone.started_at}" , 'data-content' => "#{milestone.name} <br> #{milestone.description}")
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
        concat(image_tag("hito_#{hito}_gris.png", :id => "hito-#{hito}", :title => "Hito #{hito} - #{milestone.started_at.to_s(:date) if milestone.started_at}" , 'data-content' => "#{milestone.name} <br> #{milestone.description}"))
      end
    end
  end
  
  def comentarios_count(promesa)
    concat(content_tag(:span, promesa.comments.available_comments.count.to_s + " Comentarios", :class => 'comentarios_counter'))
  end
  
  def promesas_temas(promesa)
    concat raw 'Promesa de ' + promesa.topics.collect {|topic| link_to topic.name, promesas_filters_path(:topic, topic.name)}.join(', ')
  end
end
