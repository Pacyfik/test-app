$("#store_<%= @store.id %>").fadeOut "fast", ->
  @remove()
