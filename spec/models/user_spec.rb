require 'rails_helper'

describe Ingredient, type: :model do
  context 'associations' do
    it { is_expected.to have_many :ingredient_attitudes }
  end
end
