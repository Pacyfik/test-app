class Company < ActiveRecord::Base
  has_many :stores, dependent: :destroy

  validates :name, :presence => true, :uniqueness => true

  accepts_nested_attributes_for :stores
end
