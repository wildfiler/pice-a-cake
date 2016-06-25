require 'rails_helper'

describe RecipeStep, type: :model do
  context 'associations' do
    it { is_expected.to belong_to :recipe }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of :recipe }
    it { is_expected.to validate_presence_of :text }
    it { is_expected.to validate_presence_of :position }
  end
end
