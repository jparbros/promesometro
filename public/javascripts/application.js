$.extend({
  show_states: function() {
    $('area').click(function() {
      $('.province').hide();
      $('#' + $(this).attr('title')).show();
      return false;
    })
  }
});

$(document).ready(function(){  
  $.show_states();
});
