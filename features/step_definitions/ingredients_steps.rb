Then(/^see "([^"]*)" ingredient$/) do |ingredient_name|
  expect(page).to have_css('tr td', text: ingredient_name)
end

Then(/^not see "([^"]*)"$/) do |ingredient_name|
  expect(page).to_not have_content(ingredient_name)
end

And(/^add components$/) do |components|
  components.hashes.each_with_index do |component, i|
    select component[:name], from: "receipt_components_attributes_#{i}_ingredient_id"
    fill_in "receipt_components_attributes_#{i}_quantity", with: component[:quantity]
    fill_in "receipt_components_attributes_#{i}_units", with: component[:units]
  end
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
