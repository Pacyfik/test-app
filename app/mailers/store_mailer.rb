class StoreMailer < ActionMailer::Base
  default from: "from@example.com", to: "admin@example.com"

  def employee_list_email(store)
    @store = store
    mail(:subject => "[#{@store.location_name}] List of store's employees.")
  end
end
