class CreateRecipeImages < ActiveRecord::Migration[5.0]
  def change
    create_table :recipe_images do |t|
      t.string :image
      t.string :description
      t.references :recipe, foreign_key: true

      t.timestamps
    end
  end
end
