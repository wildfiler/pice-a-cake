require 'rails_helper'

describe 'User visit root page' do
  it 'sees only last ten receipts' do
    old_receipt = create :receipt, title: 'Very old receipt', created_at: 3.days.ago
    ten_new_receipts = create_list :receipt, 10, created_at: 1.day.ago

    visit '/'

    ten_new_receipts.each do |receipt|
      expect(page).to have_css('.receipt', text: receipt.title)
    end
    expect(page).to_not have_css('.receipt', text: old_receipt.title)
  end
end
