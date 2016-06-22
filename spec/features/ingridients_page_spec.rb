require 'rails_helper'

describe 'User visit ingredients page' do
  context 'user signed in' do
    it 'sees only not hated ingredients' do
      user = create :user
      loved_ingredient = create :ingredient_attitude, :love, user: user
      hated_ingredient = create :ingredient_attitude, :hate, user: user
      no_attitude_ingredient = create :ingredient

      visit ingredients_path(as: user)

      expect(page).to have_content(loved_ingredient.ingredient.name)
      expect(page).to have_content(no_attitude_ingredient.name)
      expect(page).to_not have_content(hated_ingredient.ingredient.name)
      expect(page).to_not have_content(hated_ingredient.ingredient.name)
    end

    it 'not sees only his hated ingredients' do
      user = create :user
      other_user = create :user
      hated_ingredient = create :ingredient_attitude, :hate, user: user
      loved_ingredient = create :ingredient_attitude, :love, user: user
      other_user_hated_ingredient = create :ingredient_attitude, :hate, user: other_user

      visit ingredients_path(as: user)

      expect(page).to_not have_content(hated_ingredient.ingredient.name)
      expect(page).to have_content(loved_ingredient.ingredient.name)
      expect(page).to have_content(other_user_hated_ingredient.ingredient.name)
    end
  end

  context 'user not signed in' do
    it 'sees ingredients list' do
      ingredients = create_list :ingredient, 2
      visit ingredients_path

      ingredients.each do |ingredient|
        expect(page).to have_content(ingredient.name)
      end
    end
  end
end
