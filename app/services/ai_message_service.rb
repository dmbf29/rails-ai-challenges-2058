# AiMessage.new(@message).call
class AiMessageService
  def initialize(message)
    @message = message
  end

  def call
    # call the ai and create the message here
    prompt = @message.build_prompt
    response = RubyLLM.chat.ask(prompt)
    Message.create(role: 'assistant', content: response.content, chat: @message.chat)
  end
end
