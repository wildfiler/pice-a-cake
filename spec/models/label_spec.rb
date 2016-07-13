require 'rails_helper'

describe Label, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:recipes).through(:recipe_labels) }
    it { is_expected.to have_many(:recipe_labels).dependent(:destroy) }
  end
end
