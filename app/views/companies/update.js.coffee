<% store = @company.stores.last %>
$(".edit_company").fadeOut "fast", ->
  @remove()
$("#new-store-link").fadeIn "fast"
$("#stores-list").append """
                         <li id="store_<%= store.id %>"><%= link_to store.location_name, store %> (<%= link_to 'Destroy', store, method: :delete, data: { confirm: 'Are you sure? This action might destroy some of the associated employees.' }, remote: true %>)</li>
                         """
