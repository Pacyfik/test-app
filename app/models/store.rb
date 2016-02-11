class Store < ActiveRecord::Base
  belongs_to :company
  has_and_belongs_to_many :employees, :uniq => true

  validates :location_name, :presence => true, :uniqueness => true
  validates :company_id, :presence => true

  before_destroy :check_employees

  def company_name
    company.name
  end

  def send_admin_email
    StoreMailer.employee_list_email(self).deliver
    self.update_column(:last_admin_email, DateTime.now)
  end

  private

  def check_employees
    employees.each do |employee|
      if employee.stores_count == 1
        employee.destroy
      end
    end
  end
end
