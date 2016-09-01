And(/^recipe "([^"]*)"$/) do |recipe_name|
  create :recipe, title: recipe_name
end

Then(/^see "([^"]*)" recipe$/) do |recipe_name|
  expect(page).to have_content(recipe_name)
end

Then(/^not see "([^"]*)" recipe$/) do |recipe_name|
  expect(page).to_not have_content(recipe_name)
end

Given(/^recipes$/) do |recipes|
  # recipes is a recipes.hashes.keys # => [:name]
  recipes.hashes.each do |recipe|
    create :recipe, title: recipe['name']
  end
end

When(/^fill recipe form$/) do
  @recipe = attributes_for(:recipe)

  step %{fill "Title" with "#{@recipe[:title]}"}
  components = (1..5).map { attributes_for :component }
  components_table = components.map { |attr| "|#{attr[:name]}|#{attr[:quantity]}|#{attr[:unit]}|" }
  components_table.unshift('|name|quantity|unit|')
  step 'add components', table(components_table.join('\n'))
  step %{fill "Description" with "#{@recipe[:description]}"}
end

And(/^fill five steps for recipe$/) do
  @recipe_steps = [
    'Catch mad parrot',
    "Kick it's ass",
    'Cook the cookie',
    'Make parrot look like you eat the cookie',
    'Laugh on it'
  ]
  @recipe_steps.each_with_index do |text, i|
    steps <<-STEPS
      When fill "recipe_steps_attributes_#{i}_text" with "#{text}"
    STEPS
  end
end

Then(/^I expect to be on added recipe page$/) do
  step %{on "#{@recipe[:title]}" recipe page}
end

Then(/^I expect to be on existing recipe page$/) do
  step %{on "#{@recipe[:title]}" recipe page}
end

And(/^see recipe steps$/) do
  @recipe_steps.each do |step|
    steps <<-STEPS
      Then see "#{step}"
    STEPS
  end
end

And(/^I expect to see recipt components$/) do
  @components.each do |component|
    step %{see "#{component[:name]}"}
  end
end

Given(/^recipe with components and steps$/) do
  @recipe = create(:recipe, :with_components)
  build_list(:recipe_step, 5, recipe: @recipe)
end

When(/^change one component of recipe$/) do
  first_component = find('.component select', match: :first)
  select Ingredient.last.name, from: first_component[:name]
end

When(/^change one step of recipe$/) do
  first_step = find('.step .text', match: :first)
  @changed_step_text = 'Cook for 14 million hours on slow fire'
  fill_in first_step[:name], with: @changed_step_text
end

Then(/^I expect to see that changes$/) do
  expect(find('.component', match: :first)).to have_content(Ingredient.last.name)
  expect(page).to have_content(@changed_step_text)
end
