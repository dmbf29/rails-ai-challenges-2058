class MessagesController < ApplicationController

  def create
    @chat = Chat.find(params[:chat_id])
    @message = Message.new(message_params)
    @message.role = 'user'
    @message.chat = @chat
    if @message.save
      # TODO: Have the AI to answer this message
      AiMessageService.new(@message).call
      redirect_to chat_path(@chat)
    else
      render 'chats/show', status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
