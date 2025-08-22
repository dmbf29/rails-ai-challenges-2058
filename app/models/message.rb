class Message < ApplicationRecord
  acts_as_message
  belongs_to :chat
  after_create_commit :broadcast_append_to_chat

  # validates :content, presence: true

  scope :visible, -> { where(role: %i[user assistant]).where.not(content: [nil, '']) }

  # @message.build_prompt
  def build_prompt
    <<~PROMPT
      You are a Teaching Assistant.

      I am a student at the Le Wagon Web Development Bootcamp, learning how to code.

      Help me break down my problem into small, actionable steps, without giving away solutions.

      Answer concisely in markdown.

      If the question is regarding computer setup or some OS issues, use AvailableTeachersTool and suggest them to make a support ticket with available teachers instead.

      Here is the context of the challenge the student is working on: \n#{chat.challenge.content}.
    PROMPT
  end

  private

  def broadcast_append_to_chat
    return unless role.in?(["user", "assistant"])

    broadcast_append_to chat, target: "messages", partial: "messages/message", locals: { message: self }
  end
end
