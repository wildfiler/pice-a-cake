require 'rails_helper'

describe User, type: :model do
  context 'associations' do
    it { is_expected.to validate_inclusion_of(:role).in_array(User::ROLES) }
  end

  context 'roles' do
    it 'has default role set to user' do
      user = build_stubbed :user
      expect(user.role).to eq('user')
    end
  end
end
