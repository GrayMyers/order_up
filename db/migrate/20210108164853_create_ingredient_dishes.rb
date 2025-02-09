class CreateIngredientDishes < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredient_dishes do |t|
      t.integer :amount
      t.references :dish, foreign_key: true
      t.references :ingredient, foreign_key: true
    end
  end
end
