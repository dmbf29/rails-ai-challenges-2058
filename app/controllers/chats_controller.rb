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
    if Rails.env.development?
      @input_tokens = @chat.messages.pluck(:input_tokens).compact.sum
      @output_tokens = @chat.messages.pluck(:output_tokens).compact.sum
      # @context_window = RubyLLM.models.find(@chat.model_id).context_window
    end
  end
end
