class Question < ActiveRecord::Base
  validates :title, :answer, presence: true
end
