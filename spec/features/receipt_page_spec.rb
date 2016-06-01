require 'rails_helper'

describe 'User visit receipt page' do
  it 'sees receipt description' do
    receipt = create :receipt, :with_components

    visit receipt_path(receipt)

    expect(page).to have_content(receipt.title)
    expect(page).to have_content(receipt.description)
    receipt.components.each { |component| page_have_component(component) }
  end

  def page_have_component(component)
    expect(page).to have_content(component.ingredient.name)
    expect(page).to have_content(component.quantity)
    expect(page).to have_content(component.units)
  end
end
