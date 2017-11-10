$(document).ready(function() {
  $("#comment-on-post").hide();
  $("#comment-on-answer").hide();
  $(".joke-heading-punchline").hide();


  $("#click-to-comment-post").on("click", function(event) {
    event.preventDefault();
    
    $("#comment-on-post").show();
  });

  $("#click-to-comment-answer").on("click", function(event) {
    event.preventDefault();
    
    $("#comment-on-answer").show();
  });

  $(".answer-form").on( "submit", function(event) {
    event.preventDefault();
    
    $(".joke-heading-punchline").show();
  });


});
