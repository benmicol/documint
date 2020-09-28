class MessagesController < ApplicationController
  inherit_resources
  before_action :find_message, only: [:show, :edit, :update, :destroy]

  def index
    @messages = Message.all
  end

  def show
    redirect_to messages_path
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to @message, notice: "Message created!"
    else
      render :new
    end
  end

  private

  def begin_of_association_chain
      current_account
    end

  def message_params
    params.require(:message).permit(:account_id, :content)
  end

  def find_message
    @message = Message.find(params[:id])
  end
end
