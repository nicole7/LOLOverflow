$(document).ready(function() {
  $("#comment-on-post").hide();
  $(".comment-on-answer").hide();
  $(".joke-heading-punchline").hide();


  $(".joke-stuff").on("click", "#click-to-comment-post", function(event) {
    event.preventDefault();

    $("#comment-on-post").show();
  });

  $(".answer-stuff").on("click", ".click-to-comment-answer", function(event) {
    event.preventDefault();
    console.log("clicking on the Add a Comment button");
    console.log($(this).find(".comment-on-answer"));
    $(this).find(".comment-on-answer").show();
  });

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
      $(".appear-answer").prepend(response);
      $("#answer-form-text-area").val("");
      $(".appear-answer .comment-on-answer").hide();
    });

    $(".joke-heading-punchline").show();
  });


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
    $(".display-vote-tally").text(response.tally);
    $link.css("color", "#7f4f15");
    $link.closest('.stats-show').find('.fa-arrow-circle-down').css("color", "#3f5884");
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
      $('.display-vote-tally').text(response.tally);
      $link.css("color", "#7f4f15");
      $link.closest('.stats-show').find('.fa-arrow-circle-up').css("color", "#3f5884");
    });
});

});
