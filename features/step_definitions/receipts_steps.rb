And(/^receipt "([^"]*)"$/) do |receipt_name|
  create :receipt, title: receipt_name
end

Then(/^see "([^"]*)" receipt$/) do |receipt_name|
  pending
end

Then(/^not see "([^"]*)" receipt$/) do |receipt_name|
  pending
end

Given(/^receipts$/) do |receipts|
  # receipts is a receipts.hashes.keys # => [:name]
  receipts.hashes.each do |receipt|
    create :receipt, title: receipt['name']
  end
end
