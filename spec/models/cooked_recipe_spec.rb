require 'rails_helper'

describe CookedRecipe, type: :model do
  context 'associations' do
    it { is_expected.to belong_to :user }
    it { is_expected.to belong_to :recipe }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of :user_id }
    it { is_expected.to validate_presence_of :recipe_id }

    it 'validates uniqueness of recipe_id in scope of user_id' do
      user = create :user
      recipe = create :recipe
      create :cooked_recipe, user: user, recipe: recipe
      expect(build(:cooked_recipe, user: user, recipe: recipe)).not_to be_valid
    end
  end
end
