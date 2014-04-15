class MessagesController < ApplicationController
  
  inherit_resources
  
  def incoming
    
    @chat = Chat.find_by_phone_number(params[:from])
    
    if !@chat
      @chat = Chat.create(phone_number: params[:from], status: 'New')
    end
    
    @chat.status = "New Incoming"
    @message = @chat.messages.create(is_incoming: true, from: params[:from], to: params[:to], body: params[:body])
    
    render :nothing => true
  end
  
  def create
    create!{chat_path(@message.chat)}
  end
  
end