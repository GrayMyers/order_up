require "rails_helper"

describe "chef show page" do
  before :each do
    @chef = Chef.create(name: "Chef Boyardee")
    @dish = @chef.dishes.create(name: "Soup", description: "its soup")
    @ingredient1 = Ingredient.create(name: "Noodles", calories: 50)
    @ingredient2 = Ingredient.create(name: "Chicken broth", calories: 20)
    @ingredient3 = Ingredient.create(name: "Chicken", calories: 55)

    @dish = @chef.dishes.create(name: "Mac & Cheese", description: "its mac and cheese but theres also chicken")
    @ingredient4 = Ingredient.create(name: "Macaroni", calories: 50)
    @ingredient5 = Ingredient.create(name: "Cheese", calories: 20)
    @ingredient6 = Ingredient.create(name: "Chicken", calories: 55)

    IngredientDish.create(ingredient: @ingredient1, dish: @dish, amount: 1)
    IngredientDish.create(ingredient: @ingredient2, dish: @dish, amount: 2)
    IngredientDish.create(ingredient: @ingredient3, dish: @dish, amount: 3)

    visit "/chefs/#{@chef.id}"
  end

  it "has a link to chef ingredient index page" do
    click_on("See Used Ingredients")
    expect(current_path).to eq("/chefs/#{@chef.id}/ingredients")
  end

end
