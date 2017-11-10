$(document).ready(function() {
  $("#comment-on-post").hide();
  $(".comment-on-answer").hide();
  $(".joke-heading-punchline").hide();


  $(".joke-stuff").on("click", "#click-to-comment-post", function(event) {
    event.preventDefault();
    
    $("#comment-on-post").show();
  });

  $(".answer-stuff").on("click", "#click-to-comment-answer", function(event) {
    event.preventDefault();
    $(this).siblings(".comment-on-answer").show();
  });

  $(".answer-form").on( "submit", function(event) {
    event.preventDefault();
    
    $(".joke-heading-punchline").show();
  });


});
