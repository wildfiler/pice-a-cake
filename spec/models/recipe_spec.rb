require 'rails_helper'

describe Recipe do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:components).dependent(:destroy) }
    it { is_expected.to have_many(:steps).dependent(:destroy).class_name('RecipeStep') }
    it { is_expected.to have_many(:recipe_labels).dependent(:destroy) }
    it { is_expected.to have_many(:labels).through(:recipe_labels) }
  end

  describe '#vegeterian?' do
    context 'all ingredients are vegeterian' do
      it 'returns true' do
        recipe = create(:recipe, :vegeterian)

        expect(recipe.vegeterian?).to be_truthy
      end
    end

    context 'one of ingredients are not vegeterian' do
      it 'returns false' do
        recipe = create(:recipe, :non_vegeterian)

        expect(recipe.vegeterian?).to be_falsey
      end
    end

    context 'association is loaded' do
      it 'does not make requests to DB' do
        recipe = create(:recipe, :non_vegeterian)
        recipe.ingredients.load_target

        expect(recipe.ingredients.loaded?).to be_truthy
        expect { recipe.vegeterian? }.to_not make_database_queries
      end
    end

    context 'association is not loaded' do
      it 'makes request to DB' do
        recipe = create(:recipe, :non_vegeterian)

        expect(recipe.ingredients.loaded?).to be_falsey
        expect { recipe.vegeterian? }.to make_database_queries(count: 1)
      end
    end
  end
end
