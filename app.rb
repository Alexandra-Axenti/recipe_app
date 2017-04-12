require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }
also_reload("lib/*.rb")

get('/') do
  @recipes = Recipe.all()
  erb(:index)
end

delete('/database_reset') do
  @categories = Category.all()
  @ingredients = Ingredient.all()
  @instructions = Instruction.all()
  @recipes = Recipe.all()
  @categories.each() do |category|
    category.destroy()
  end
  @instructions.each() do |instruction|
    instruction.destroy()
  end
  @ingredients.each() do |ingredient|
    ingredient.destroy()
  end
  @recipes.each() do |recipe|
    recipe.destroy()
  end
  redirect('/')
end

post('/') do
  recipe_name = params.fetch('name')
  ingredient_name1 = params.fetch('ingredient1')
  instruction_name1 = params.fetch('instruction1')
  ingredient_name2 = params.fetch('ingredient2')
  instruction_name2 = params.fetch('instruction2')
  ingredient_name3 = params.fetch('ingredient3')
  instruction_name3 = params.fetch('instruction3')
  ingredient_name4 = params.fetch('ingredient4')
  instruction_name4 = params.fetch('instruction4')
  recipe = Recipe.create({:name => recipe_name})
  ingredient1 = Ingredient.create({:name => ingredient_name1, :recipe_id => recipe.id()})
  instruction1 = Instruction.create({:description => instruction_name1, :recipe_id => recipe.id()})
  ingredient2 = Ingredient.create({:name => ingredient_name2, :recipe_id => recipe.id()})
  instruction2 = Instruction.create({:description => instruction_name2, :recipe_id => recipe.id()})
  ingredient3 = Ingredient.create({:name => ingredient_name3, :recipe_id => recipe.id()})
  instruction3 = Instruction.create({:description => instruction_name3, :recipe_id => recipe.id()})
  ingredient4 = Ingredient.create({:name => ingredient_name4, :recipe_id => recipe.id()})
  instruction4 = Instruction.create({:description => instruction_name4, :recipe_id => recipe.id()})
  redirect("/")
end

get('/recipes/new') do
  erb(:form)
end

get('/recipes/:id') do
  @recipe = Recipe.find(params.fetch('id'))
  erb(:recipe)
end
