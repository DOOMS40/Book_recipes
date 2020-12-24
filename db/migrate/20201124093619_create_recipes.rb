class CreateRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :description
      t.references :book, foreign_key: true
      
      t.timestamps
    end
  end
end
