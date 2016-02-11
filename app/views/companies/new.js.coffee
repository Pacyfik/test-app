form = "<%= j render 'form' %>"
$("#new-company-link").fadeOut "fast", ->
  $("#new-company-wrapper").append form
