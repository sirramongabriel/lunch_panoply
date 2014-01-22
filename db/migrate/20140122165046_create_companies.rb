class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.text :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone

      t.timestamps
    end
  end
end
