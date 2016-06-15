require 'rails_helper'

describe CookedRecipe, type: :model do
  context 'associations' do
    it { is_expected.to belong_to :user }
    it { is_expected.to belong_to :receipt }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of :user_id }
    it { is_expected.to validate_presence_of :receipt_id }

    it 'validates uniqueness of receipt_id in scope of user_id' do
      user = create :user
      receipt = create :receipt
      create :cooked_recipe, user: user, receipt: receipt
      expect(build(:cooked_recipe, user: user, receipt: receipt)).not_to be_valid
    end
  end
end
