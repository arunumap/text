class MessagesController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:incoming, :create]
  inherit_resources

  def incoming

    @chat = Chat.find_by_phone_number(params[:From])

    if !@chat
      @chat = Chat.create(phone_number: params[:From], status: 'New')
    end

    @chat.status = "New Incoming"
    @message = @chat.messages.create(is_incoming: true, from: params[:From], to: params[:To], body: params[:Body])
    render :nothing => true
  end

  def create
    create!{chat_path(@message.chat)}
  end

end
