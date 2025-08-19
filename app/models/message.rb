class Message < ApplicationRecord
  belongs_to :chat

  # @message.build_prompt
  def build_prompt
    prompt = <<-PROMPT
      You are a coding teacher assistant
      I am a beginner coder at a Ruby bootcamp
      This challenge:#{chat.challenge.content}.
      #{content}
      Provide step-by-step instructions in bullet points, using markdown.
    PROMPT
  end
end
