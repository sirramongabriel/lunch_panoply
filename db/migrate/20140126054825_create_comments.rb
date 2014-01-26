class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.string :title
      t.string :commentable_type

      t.timestamps
    end
  end
end
