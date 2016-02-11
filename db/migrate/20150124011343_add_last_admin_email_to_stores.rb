class AddLastAdminEmailToStores < ActiveRecord::Migration
  def change
    add_column :stores, :last_admin_email, :datetime
  end
end
