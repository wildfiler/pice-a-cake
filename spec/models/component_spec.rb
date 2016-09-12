require 'rails_helper'

describe Component do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:ingredient_id) }
    it { is_expected.to validate_presence_of(:recipe) }
  end

  describe 'uniqueness' do
    it 'there can be only one unique ingredient in recipe' do
      ingredient = create :ingredient
      recipe = build :recipe
      component = create :component, ingredient: ingredient
      duplicated_component = build :component, ingredient: ingredient
      recipe.components = [component, duplicated_component]

      expect(recipe).to_not be_valid
    end
  end
end
