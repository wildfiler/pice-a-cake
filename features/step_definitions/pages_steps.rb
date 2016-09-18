PAGE_ROUTES = {
  home: '/',
  add_ingredient: '/ingredients/new',
  ingredients_list: '/ingredients',
  add_recipe: '/recipes/new',
  my_loved_ingredients: '/ingredients/loved',
  my_hated_ingredients: '/ingredients/hated',
  my_loved_recipes: '/recipes/loved',
  my_hated_recipes: '/recipes/hated',
  cooked_recipes: '/recipes/cooked',
  faq: '/faq'
}.freeze

When(/^on "([^"]*)" page$/) do |page_name|
  key = page_name.downcase.tr(' ', '_').to_sym
  expect(current_path).to eq(PAGE_ROUTES[key])
end

When(/^visit "([^"]*)" page$/) do |page_name|
  key = page_name.downcase.tr(' ', '_').to_sym
  if PAGE_ROUTES.key?(key)
    visit PAGE_ROUTES[key]
  else
    visit page_name
  end
end

Then(/^on "([^"]*)" recipe page$/) do |recipe_name|
  path = current_path
  recipe = Recipe.find_by!(title: recipe_name)
  expect(path).to eq(recipe_path(recipe))
end

When(/^visit "([^"]*)" recipe page$/) do |recipe_name|
  recipe = Recipe.find_by!(title: recipe_name)
  visit recipe_path(recipe)
end

Then(/^visit "([^"]*)" ingredient page$/) do |ingredient_name|
  ingredient = Ingredient.find_by!(name: ingredient_name)
  visit ingredient_path(ingredient)
end

When(/^visit existing recipe edit page$/) do
  visit edit_recipe_path(@recipe)
end
