require 'rails_helper'

describe 'User visit recipe page' do
  it 'sees recipe description' do
    recipe = create :recipe, :with_components

    visit recipe_path(recipe)

    expect(page).to have_content(recipe.title)
    expect(page).to have_content(recipe.description)
    recipe.components.each { |component| page_have_component(component) }
  end

  def page_have_component(component)
    expect(page).to have_content(component.ingredient.name)
    expect(page).to have_content(component.quantity)
    expect(page).to have_content(component.units)
  end
end
