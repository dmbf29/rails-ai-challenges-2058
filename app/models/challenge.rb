class Challenge < ApplicationRecord
  belongs_to :user
  has_many :chats, dependent: :destroy
  validates :name, :module, :content, presence: true
end
