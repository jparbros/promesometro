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
 }
});

$(document).ready(function(){
  $.show_milestone_comments();
  $.do_comment();
});
