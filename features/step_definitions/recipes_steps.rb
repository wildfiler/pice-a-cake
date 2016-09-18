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
  components = Ingredient.limit(5).map { |ingredient| build :component, ingredient: ingredient }
  components_table = components.map do |component|
    [
      component.ingredient.name,
      component.quantity,
      component.units,
    ]
  end
  components_table.unshift(%w{name quantity unit})
  step 'add components', table(components_table)
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
    find('.add_step', match: :first).click
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
  @recipe = create(:recipe, :with_components, :with_steps)
end

When(/^change one component of recipe$/) do
  first_component = find('.component select', match: :first)
  select Ingredient.last.name, from: first_component[:name]
end

When(/^change one step of recipe$/) do
  first_step = find('.recipe_step textarea.text', match: :first)
  @changed_step_text = 'Cook for 14 million hours on slow fire'
  fill_in first_step[:name], with: @changed_step_text
end

When(/^add one step to recipe$/) do
  @new_step_text = 'Add super shitty spice'
  find('.add_step', match: :first).click
  textfield = all('.recipe_steps_text textarea').last
  fill_in textfield[:name], with: @new_step_text
end

When(/^add one component to recipe$/) do
  find('.add_component').click
  last_component = all('.component').last
  select Ingredient.last.name, from: last_component.find('select.ingredient')[:name]
  fill_in last_component.find('input.quantity')[:name], with: '10'
  fill_in last_component.find('input.units')[:name], with: 'barrels'
end

When(/^delete component from recipe$/) do
  id = find('select.ingredient', match: :first).value
  @deleted_component = Ingredient.find(id)
  find('.remove_component', match: :first).click
end

When(/^delete step from recipe$/) do
  @deleted_step = find('.recipe_step textarea.text', match: :first).value
  find('.remove_step', match: :first).click
end

Then(/^I expect to see that changes$/) do
  expect(page).to have_content(@changed_step_text)
  expect(find('.component', match: :first)).to have_content(Ingredient.last.name)
end

Then(/^I expect to see that step$/) do
  expect(page).to have_content(@new_step_text)
end

Then(/^I expect to see that component$/) do
  expect(all('.component').last).to have_content(Ingredient.last.name)
end

Then(/^I expect not to see that component$/) do
  expect(page).not_to have_content(@deleted_component.name)
end

Then(/^I expect not to see that step$/) do
  expect(page).not_to have_content(@deleted_step)
end
