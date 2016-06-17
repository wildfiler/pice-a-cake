require 'rails_helper'

describe 'User visit ingredients page' do
  it 'sees only not hated ingredients' do
    user = create :user
    loved_ingredient = create :ingredient_attitude, :love, user: user
    hated_ingredient = create :ingredient_attitude, :hate, user: user
    no_attitude_ingredient = create :ingredient

    visit ingredients_path(as: user)

    expect(page).to have_content(loved_ingredient.ingredient.name)
    expect(page).to have_content(no_attitude_ingredient.name)
    expect(page).to_not have_content(hated_ingredient.ingredient.name)
  end
end
