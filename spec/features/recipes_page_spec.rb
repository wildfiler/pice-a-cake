require 'rails_helper'

describe 'User visit recipes page' do
  it 'sees recipes list' do
    recipes = create_list :recipe, 2, :with_components

    visit recipes_path

    recipes.each { |recipe| page_have_recipe(recipe) }
  end

  def page_have_recipe(recipe)
    expect(page).to have_content(recipe.title)
    recipe.components.each { |component| page_have_component(component) }
  end

  def page_have_component(component)
    expect(page).to have_content(component.ingredient.name)
  end
end
