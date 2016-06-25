require 'rails_helper'

describe RecipeAttitude, type: :model do
  context 'associations' do
    it { is_expected.to belong_to :user }
    it { is_expected.to belong_to :recipe }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of :user_id }
    it { is_expected.to validate_presence_of :recipe_id }
    it { is_expected.to validate_inclusion_of(:attitude).in_array(RecipeAttitude::ATTITUDES) }

    it 'validates uniqueness of recipe_id in scope of user_id' do
      user = create :user
      recipe = create :recipe
      create :recipe_attitude, user: user, recipe: recipe
      expect(build(:recipe_attitude, user: user, recipe: recipe)).not_to be_valid
    end
  end
end
