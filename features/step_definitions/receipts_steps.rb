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
