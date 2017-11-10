$(document).ready(function() {
  $("#comment-on-post").hide();
  $("#comment-on-answer").hide();

  $("#click-to-comment-post").on("click", function(event) {
    event.preventDefault();
  $("#comment-on-post").show();

  });

  $("#click-to-comment-answer").on("click", function(event) {
    event.preventDefault();
  $("#comment-on-answer").show();

  });
});
