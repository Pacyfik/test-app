$("#new_store").fadeOut "fast", ->
  @remove()
$("#new-store-link").fadeIn "fast"
$("#stores-list").append "<%= j render 'store', :store => @store %>"
