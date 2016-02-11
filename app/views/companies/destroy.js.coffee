$("#company_<%= @company.id %>").fadeOut "fast", ->
  @remove()
