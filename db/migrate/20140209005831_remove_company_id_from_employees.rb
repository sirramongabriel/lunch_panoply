class RemoveCompanyIdFromEmployees < ActiveRecord::Migration
  def change
    remove_column :employees, :company_id
  end
end
