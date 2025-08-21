class MessagesController < ApplicationController

  def create
    @chat = Chat.find(params[:chat_id])
    @message = Message.new(message_params)
    @message.role = 'user'
    @message.chat = @chat
    if @message.valid?
      # TODO: Have the AI to answer this message
      AiMessageService.new(@message).call
      # redirect_to chat_path(@chat)
      # we want to get just the last two messages create, and insert them on the page
      # Find the messages div
      # insert those last two message in there
      # (refresh the form)
      # let the default behavior, render "create.turbo_stream.erb"
    else
      render 'chats/show', status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
