class Chat < ApplicationRecord
  acts_as_chat
  belongs_to :challenge
  has_many :messages, dependent: :destroy
end
