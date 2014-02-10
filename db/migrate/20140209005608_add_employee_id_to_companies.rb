class AddEmployeeIdToCompanies < ActiveRecord::Migration
  def up
    add_column :companies, :employee_id, :integer
  end

  def down 
    remove_column :companies, :employee_id
  end
end
