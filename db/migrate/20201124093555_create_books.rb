class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string  :name
      t.decimal :number_recipes
      t.string  :genre
      t.string  :image
      t.references :user, foreign_key: true
      
      t.timestamps
    end
  end
end
