require 'rails_helper'

describe Component do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:ingredient_id) }
    it { is_expected.to validate_presence_of(:receipt_id) }
  end
end
