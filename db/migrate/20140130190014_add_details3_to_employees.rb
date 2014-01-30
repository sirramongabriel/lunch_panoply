class AddDetails3ToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :token, :string
    add_column :employees, :secret_token, :string
  end
end
