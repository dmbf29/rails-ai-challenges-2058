# AiMessage.new(@message).call
class AiMessageService
  include ActionView::Helpers

  def initialize(message)
    @message = message
    @chat = message.chat
  end

  def call
    # call the ai and create the message here
    instructions = @message.build_prompt
    # instantiate an available teacher tool specifically for batch 2058
    att_2058 = AvailableTeachersTool.new(batch_number: 2058)
    # No need for RubyLLM.chat anymore, we call ask directly on our Chat instance!
    @message.chat.with_instructions(instructions).with_tool(att_2058).ask(@message.content) do |chunk|
      next if chunk.content.blank? # skip empty chunks

      message = @chat.messages.last
      message.content += chunk.content
      broadcast_replace(message)
    end
    broadcast_replace(@chat.messages.last)
    # this knows my chat, it it know what a message is. so it's going to create BOTH messages for me

    # give it the persona / context / format
    # give it the task
    # response = chat
    # Message.create(role: 'assistant', content: response.content, chat: @message.chat)
  end

  def broadcast_replace(message)
    Turbo::StreamsChannel.broadcast_replace_to(@chat, target: dom_id(message), partial: "messages/message",
                                                      locals: { message: message })
  end
end
