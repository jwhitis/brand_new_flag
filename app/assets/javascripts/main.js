$(document).on("ready page:load", function() {

  window.setTimeout(function() {
    $("div.flash-message").alert("close");
  }, 15000);

});