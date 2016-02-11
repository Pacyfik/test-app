form = "<%= j render 'form_remote' %>"
$("#new-store-link").fadeOut "fast", ->
  $("#new-store-wrapper").append form
