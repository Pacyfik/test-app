form = '<%= j render "new_store_form" %>'
$("#new-store-link").fadeOut "fast", ->
  $("#new-store-wrapper").append form
