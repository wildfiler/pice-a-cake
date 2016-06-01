require 'rails_helper'

describe 'User visit receipts page' do
  it 'sees receipts list' do
    receipts = create_list :receipt, 2, :with_components

    visit receipts_path

    receipts.each { |receipt| page_have_receipt(receipt) }
  end

  def page_have_receipt(receipt)
    expect(page).to have_content(receipt.title)
    receipt.components.each { |component| page_have_component(component) }
  end

  def page_have_component(component)
    expect(page).to have_content(component.ingredient.name)
  end
end
