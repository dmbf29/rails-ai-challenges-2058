class Chat < ApplicationRecord
  acts_as_chat
  belongs_to :challenge
  has_many :messages, dependent: :destroy

  after_initialize :set_chat

  def set_chat
    @chat = RubyLLM.chat
  end
end
