class AddDetails2ToEmployees < ActiveRecord::Migration
  def change
  	add_column :employees, :provider, :string
  	add_column :employees, :uid, :string
  end
end
