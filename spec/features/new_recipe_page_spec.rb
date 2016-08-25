require 'rails_helper'

describe 'User visit new recipe page', js: true do
  it 'can add component field' do
    visit new_recipe_path

    number_of_component_fields = page.all('.component').count
    click_on('Add component')

    expect(page).to have_css('.component', count: number_of_component_fields + 1)
  end
  it 'can delete component field' do
    visit new_recipe_path

    number_of_component_fields = page.all('.component').count
    first('.component').click_link('Remove')

    expect(page).to have_css('.component', count: number_of_component_fields - 1)
  end
end
