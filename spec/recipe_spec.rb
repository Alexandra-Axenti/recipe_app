require('spec_helper')

describe(Recipe) do
  it { should have_many(:instructions) }
  it { should have_many(:ingredients) }
  it { should have_and_belong_to_many(:categories) }

  it("capitalizes each word in a recipe name") do
    test_recipe = Recipe.create({:name => "fRIED pOTATOES", :rating => nil})
    expect(test_recipe.name()).to(eq('Fried Potatoes'))
  end
  
end
