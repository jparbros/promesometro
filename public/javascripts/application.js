$.extend({
 show_milestone_comments : function() {
   $('.hito_header').click(function(){
     visible = $('.hito_content:visible').attr('id');
     $('.hito_content').slideUp(600);
     number = $(this).attr('id').substr(12)
     content =  $('#hito_content_' + number);
     if (visible != content.attr('id')) {
       content.slideDown(600);
     }
   })
 },
 
 do_comment: function() {
   $('#do_comment').click(function(){
     $('.post_comment').toggle();
     return false;
   });
 },

 search_select: function() {
   $('#buscar_por').change(function(){
     $('#promise_search').find('input:text').attr('disabled','disabled').hide();
     switch($(this).attr('value')){
       case 'promesa':
         $('#search_title_contains').removeAttr('disabled').show();
         break;
       case 'representante':
         $('#search_official_name_contains').removeAttr('disabled').show();
         break;
       case 'region':
         $('#search_official_state_name_contains').removeAttr('disabled').show();
         break;
       case 'partido':
         $('#search_official_political_party_name_contains').removeAttr('disabled').show();
         break;
       case 'tema':
         $('#search_topics_contains').removeAttr('disabled').show();
         break;
      case 'dias_progreso':
         $('#search_dias_progreso_contains').removeAttr('disabled').show();
         break;
      };
   });
 },
 
 topics_filter: function() {
   $('.filtro-temas select#tema').change(function(){
     host = window.location.host;
     value = $(this).attr('value');
     window.location = 'http://' + host + '/promesas?search[topics_contains]=' + value;
   });
 }
});

$(document).ready(function(){
  $.show_milestone_comments();
  $.do_comment();
  $.search_select();
  $.topics_filter();
});
