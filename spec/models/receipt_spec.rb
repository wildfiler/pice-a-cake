require 'rails_helper'

describe Receipt do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
  end

  describe '#vegeterian?' do
    context 'all ingredients are vegeterian' do
      it 'returns true' do
        receipt = create(:receipt, :vegeterian)

        expect(receipt.vegeterian?).to be_truthy
      end
    end

    context 'one of ingredients are not vegeterian' do
      it 'returns false' do
        receipt = create(:receipt, :non_vegeterian)

        expect(receipt.vegeterian?).to be_falsey
      end
    end

    context 'association is loaded' do
      it 'does not make requests to DB' do
        receipt = create(:receipt, :non_vegeterian)
        receipt.ingredients.load_target

        expect(receipt.ingredients.loaded?).to be_truthy
        expect { receipt.vegeterian? }.to_not make_database_queries
      end
    end

    context 'association is not loaded' do
      it 'makes request to DB' do
        receipt = create(:receipt, :non_vegeterian)

        expect(receipt.ingredients.loaded?).to be_falsey
        expect { receipt.vegeterian? }.to make_database_queries(count: 1)
      end
    end
  end
end
