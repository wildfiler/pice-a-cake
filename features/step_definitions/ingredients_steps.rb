Then(/^see "([^"]*)" ingredient$/) do |ingredient_name|
  pending
end

And(/^add ingredients$/) do |ingredients|
  # table is a table.hashes.keys # => [:name, :quantity, :unit]
  pending
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
