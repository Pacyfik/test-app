$("#new_company").fadeOut "fast", ->
  @remove()
$("#new-company-link").fadeIn "fast"
$("#companies-list").append "<%= j render 'company', :company => @company %>"
