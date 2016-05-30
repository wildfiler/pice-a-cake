require 'rails_helper'

describe 'User visit ingredients page' do
  it 'sees ingredients list' do
    ingredients = create_list :ingredient, 2
    visit ingredients_path

    ingredients.each do |ingredient|
      expect(page).to have_content(ingredient.name)
    end
  end
end
