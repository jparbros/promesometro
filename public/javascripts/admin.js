$.extend({
  new_milestone: function() {
    $('a#nuevo_hito').click(function(){
      html = $('#new_milestones .well').first().clone();
      $.clean_milestone(html);
      html.appendTo('#new_milestones');
      return false;
    });
  },
  
  clean_milestone: function(html) {
    html.find('input').val('').attr('name','promise[milestones_attributes]['+$('#new_milestones .well').size()+'][name]');
    html.find('textarea').val('').attr('name','promise[milestones_attributes]['+$('#new_milestones .well').size()+'][description]');;
  },
  
  close_milestone: function() {
    $('.well a.close').live('click',function(){
      if($('#new_milestones .well').size() > 1)
        $(this).parent().remove();
      return false;
    });
  },
  
  close_alerts: function() {
    $('.alert-message a.close').click(function(){
      $(this).parent().hide();
    });
  }
});

$(document).ready(function(){  
  $.new_milestone();
  $.close_milestone();
  $.close_alerts();
});