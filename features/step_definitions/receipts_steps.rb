And(/^receipt "([^"]*)"$/) do |receipt_name|
  create :receipt, title: receipt_name
end

Then(/^see "([^"]*)" receipt$/) do |receipt_name|
  expect(page).to have_content(receipt_name)
end

Then(/^not see "([^"]*)" receipt$/) do |receipt_name|
  expect(page).to_not have_content(receipt_name)
end

Given(/^receipts$/) do |receipts|
  # receipts is a receipts.hashes.keys # => [:name]
  receipts.hashes.each do |receipt|
    create :receipt, title: receipt['name']
  end
end


When(/^fill recipe form$/) do
  @recipe = attributes_for(:receipt)

  step %{fill "Title" with "#{@recipe[:title]}"}
  components = (1..5).map{ attributes_for :component }
  components_table = components.map{|attr| "|#{attr[:name]}|#{attr[:quantity]}|#{attr[:unit]}|"}
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
      When fill "receipt_steps_attributes_#{i}_text" with "#{text}"
    STEPS
  end
end

Then(/^I expect to be on added recipe page$/) do
  step %{on "#{@recipe[:title]}" receipt page}
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
