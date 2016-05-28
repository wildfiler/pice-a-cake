Given(/^signed in user$/) do
  pending
end

And(/^check "([^"]*)" checkbox$/) do |checkbox|
  check checkbox
end

And(/^click "([^"]*)"$/) do |button_or_link|
  click_link_or_button(button_or_link)
end

And(/^fill "([^"]*)" with "([^"]*)"$/) do |field, value|
  fill_in field, with: value
end

And(/^select "([^"]*)" as "([^"]*)"$/) do |field, value|
  select value, from: field
end

Then(/^not see "([^"]*)" button$/) do |button_name|
  expect(page).to_not have_css('button', text: button_name)
end

And(/^see "([^"]*)"$/) do |content|
  expect(page).to have_content content
end
