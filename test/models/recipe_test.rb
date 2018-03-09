require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  def setup
    @chef = Chef.create!(chefname: "sabtain", email: "test1@test.com")
    @recipe = @chef.recipes.build(name: "vegetable", description: "great vegetable recipe")
  end

  test "recipe should be valid" do
    assert @recipe.valid?
  end
  test "name shuold be present " do
    @recipe.name = " "
    assert_not @recipe.valid?
  end
  test " description name should be present " do
    @recipe.description = " "
    assert_not @recipe.valid?
  end
end