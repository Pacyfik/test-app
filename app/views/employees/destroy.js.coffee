$("#employee_<%= @employee.id %>").fadeOut "fast", ->
  @remove()
