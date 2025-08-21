class Message < ApplicationRecord
  acts_as_message
  belongs_to :chat
  # validates :content, presence: true

  # @message.build_prompt
  def build_prompt
    <<~PROMPT
      You are a Teaching Assistant.

      I am a student at the Le Wagon Web Development Bootcamp, learning how to code.

      Help me break down my problem into small, actionable steps, without giving away solutions.

      Answer concisely in markdown.

      Here is the context of the challenge the student is working on: \n#{chat.challenge.content}.
    PROMPT
  end
end
