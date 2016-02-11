class Employee < ActiveRecord::Base
  has_and_belongs_to_many :stores, :uniq => true

  validates :email, :presence => true, :uniqueness => true
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :stores, :presence => { :message => " - an employee must be associated with at least one store" }

  def full_name
    "#{first_name} #{last_name}"
  end

  def stores_count
    stores.count
  end
end
