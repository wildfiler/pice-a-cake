require 'rails_helper'

describe 'User visit root page' do
  it 'sees only last ten recipes' do
    old_recipe = create :recipe, title: 'Very old recipe', created_at: 3.days.ago
    ten_new_recipes = create_list :recipe, 10, created_at: 1.day.ago

    visit '/'

    ten_new_recipes.each do |recipe|
      expect(page).to have_css('.recipe', text: recipe.title)
    end
    expect(page).to_not have_css('.recipe', text: old_recipe.title)
  end
end
