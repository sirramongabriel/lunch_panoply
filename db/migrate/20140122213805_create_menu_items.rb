class CreateMenuItems < ActiveRecord::Migration
  def change
    create_table :menu_items do |t|
      t.string :title
      t.string :ingredient1
      t.string :ingredient2
      t.string :ingredient3
      t.string :ingredient4
      t.string :ingredient5
      t.string :ingredient6
      t.string :ingredient7
      t.string :ingredient8
      t.string :ingredient9
      t.string :ingredient10
      t.string :ingredient11
      t.string :ingredient12
      t.string :ingredient13
      t.string :ingredient14
      t.string :ingredient15
      t.string :ingredient16
      t.string :ingredient17
      t.string :ingredient18
      t.string :ingredient19
      t.string :ingredient20
      t.string :calories
      t.string :price
      t.binary :img1
      t.binary :img2
      t.binary :img3
      t.binary :img4
      t.binary :img5

      t.timestamps
    end
  end
end
