module Admin::CommentsHelper
  
  def comment_kind(kind)
    case kind
    when 'citizens'
      'Ciudadanos'
    when 'government'
      'Gobierno'
    end
  end
  
  def link_to_approval(comment)
    if comment.approved?
      link_to 'Desaprobar', admin_comment_comment_approval_path(comment), :method => :delete
    else
      link_to 'Aprobar', admin_comment_comment_approval_path(comment), :method => :post
    end
  end
end
