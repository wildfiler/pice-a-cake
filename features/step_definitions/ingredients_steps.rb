Then(/^see "([^"]*)" ingredient$/) do |ingredient_name|
  expect(page).to have_css('tr td', text: ingredient_name)
end

Then(/^not see "([^"]*)"$/) do |ingredient_name|
  expect(page).to_not have_content(ingredient_name)
end

And(/^add components$/) do |components|
  @components = components.hashes
  components.hashes.each_with_index do |component, i|
    last_component = all('.component').last
    select component[:name], from: last_component.find('select.ingredient')[:name]
    fill_in last_component.find('input.quantity')[:name], with: component[:quantity]
    fill_in last_component.find('input.units')[:name], with: component[:units]
    click_link 'Add component' if i < components.hashes.length - 1
  end
end

Given(/^(\d+) ingredients$/) do |count|
  create_list :ingredient, count.to_i
end

Given(/^ingredients$/) do |ingredients|
  # table is a table.hashes.keys # => [:name]
  ingredients.hashes.each do |ingredient|
    create :ingredient, name: ingredient['name']
  end
end

Given(/^ingredient "([^"]*)"$/) do |ingredient|
  create :ingredient, name: ingredient
end
