module PromesasHelper
  
  def link_to_official(official)
    case official.position
    when 0
      link_to('Perfil del ' + official.position_name, alcalde_path(official))
    when 1
      link_to('Perfil del ' + official.position_name, presidentes_regionale_path(official))
    end
  end
end
