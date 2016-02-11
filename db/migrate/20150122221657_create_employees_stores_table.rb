class CreateEmployeesStoresTable < ActiveRecord::Migration
  def change
    create_table :employees_stores, :id => false do |t|
      t.references :employee
      t.references :store
    end
  end
end
