require 'rails_helper'

describe RecipeLabel, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of(:recipe_id) }
    it { is_expected.to validate_presence_of(:label_id) }
  end
end
