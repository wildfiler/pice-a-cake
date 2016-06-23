require 'rails_helper'

describe Question, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_presence_of :answer }
  end
end
