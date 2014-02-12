class AddVenueIdToMenu < ActiveRecord::Migration
  def change
    add_column :menus, :venue_id, :integer, null: false
  end
end
