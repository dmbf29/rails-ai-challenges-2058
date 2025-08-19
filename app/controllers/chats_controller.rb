class ChatsController < ApplicationController

  def index
    @challenge = Challenge.find(params[:challenge_id])
    @chats = @challenge.chats
  end

  def create
    @challenge = Challenge.find(params[:challenge_id])
    @chat = Chat.new(title: "Chat ##{@challenge.chats.count + 1}")
    @chat.challenge = @challenge
    if @chat.save
      redirect_to chat_path(@chat)
    else
      render 'challenges/show', status: :unprocessable_entity
    end
  end

  def show
    @chat = Chat.find(params[:id])
    @challenge = @chat.challenge
    @message = Message.new
  end
end
