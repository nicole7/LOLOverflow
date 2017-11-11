$(document).ready(function() {
  $("#comment-on-post").hide();
  $(".comment-on-answer").hide();
  $(".joke-heading-punchline").hide();

// SHOW COMMENT FORM ON JOKE
  $(".joke-stuff").on("click", "#click-to-comment-post", function(event) {
    event.preventDefault();
    $("#comment-on-post").toggle();
  });

// SHOW COMMENT ON ANSWER
  $(".add-comment-link").on("click", function(event) {
    event.preventDefault();
    console.log("working");
    $(this).parents().first().siblings(".comment-on-answer").toggle();
  });

// ADD ANSWER FORM SUBMISSION
  $(".answer-form").on( "submit", function(event) {
    event.preventDefault();
    var $form = $(this);

    var url = $form.attr("action");
    var data = $form.serialize();
    var method = $form.attr("method");

    var ajaxRequest = $.ajax( {
      url: url,
      method: method,
      data: data
    });

    ajaxRequest.done( function(response) {
      if (response.login === "logged-out") {
      window.location = $("#login-button").attr("href");
      alert(response.message);
      } else {
      $(".appear-answer").prepend(response);
      $("#answer-form-text-area").val("");
      $(".appear-answer .comment-on-answer").hide();
      $(".joke-heading-punchline").show();
      };
    });

  });

// SHOW ANSWERS ON JOKE AUTHOR PROFILE PAGE 
$('.see-answers-form').on('click', function(event){
  event.preventDefault();
  var $form = $(this);
  var url = $form.attr("action");

  $.ajax({
    url: url
  }).done(function(response){
    $('.see-answers').append(response);
  });
});

//up-vote
$(".fa-arrow-circle-up").on("click", function(event) {
  event.preventDefault();

  var $link = $(this);
  var url = $link.closest("a").attr("href");


  $.ajax({
    url: url
  }).done( function(response) {
    console.log(response);
    if (response.tally != null) {
      $link.parents().eq(2).find(".display-vote-tally").text(response.tally);
      $link.css("color", "#7f4f15");
      $link.closest('.stats-show').find('.fa-arrow-circle-down').css("color", "#3f5884");
    } else if (response.login === "logged-out") {
      window.location = $("#login-button").attr("href");
      alert(response.message);      
    };
  });
});

//down-vote
$('.fa-arrow-circle-down').on('click', function(event){
    event.preventDefault();

    var $link = $(this);
    var url = $link.closest('a').attr('href');

    $.ajax({
      url: url
    }).done(function(response){
      if (response.tally != null) {
      $link.parents().eq(2).find(".display-vote-tally").text(response.tally);
      $link.css("color", "#7f4f15");
      $link.closest('.stats-show').find('.fa-arrow-circle-up').css("color", "#3f5884");
      } else if (response.login === "logged-out") {
      window.location = $("#login-button").attr("href");
      };
    });
});

});
