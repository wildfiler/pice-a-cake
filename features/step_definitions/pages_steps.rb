PAGE_ROUTES = {
  home: '/',
  add_ingredient: '/ingredients/new'
}.freeze

When(/^on "([^"]*)" page$/) do |page_name|
  pending
end

When(/^visit "([^"]*)" page$/) do |page_name|
  key = page_name.downcase.underscore.to_sym
  if PAGE_ROUTES.key?(key)
    visit PAGE_ROUTES[key]
  else
    visit page_name
  end
end

Then(/^on "([^"]*)" receipt page$/) do |receipt_name|
  receipt = Receipt.find_by!(name: receipt_name)
  expect(current_path).to eq(receipt_path(receipt))
end

When(/^visit "([^"]*)" receipt page$/) do |receipt_name|
  receipt = Receipt.find_by!(name: receipt_name)
  visit receipt_path(receipt)
end

Then(/^visit "([^"]*)" ingredient page$/) do |ingredient_name|
  ingredient = Ingredient.find_by!(name: ingredient_name)
  visit receipt_path(ingredient)
end
