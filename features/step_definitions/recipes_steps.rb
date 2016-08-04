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
