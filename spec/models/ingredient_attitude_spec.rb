require 'rails_helper'

describe IngredientAttitude, type: :model do
  context 'associations' do
    it { is_expected.to belong_to :user }
    it { is_expected.to belong_to :ingredient }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of :user_id }
    it { is_expected.to validate_presence_of :ingredient_id }
    it { is_expected.to validate_inclusion_of(:attitude).in_array(IngredientAttitude::ATTITUDES) }

    it 'validates uniqueness of ingredient_id in scope of user_id' do
      user = create :user
      ingredient = create :ingredient
      create :ingredient_attitude, user: user, ingredient: ingredient
      expect(build(:ingredient_attitude, user: user, ingredient: ingredient)).not_to be_valid
    end
  end
end
