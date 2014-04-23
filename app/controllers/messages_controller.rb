class MessagesController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:incoming, :create]
  inherit_resources


  def incoming

    @chat = Chat.find_by_phone_number(params[:From])

    if !@chat
      @chat = Chat.create(phone_number: params[:From], status: 'New')
      #twillio
      account_sid = 'AC7d08ed05ef894dba8d039e6ff5238d8a'
      auth_token = '92749b4da6ab89cbffc139b9b09a712d'
      @client = Twilio::REST::Client.new account_sid, auth_token

      @client.account.sms.messages.create(
        :from => '+16467362220',
        :to => params[:From],
        :body => "Thanks for texting NYTechday, We will get back to you ASAP!"
      )
    end

    @chat.status = "New Incoming"
    @message = @chat.messages.create(is_incoming: true, from: params[:From], to: params[:To], body: params[:Body])
    render :nothing => true
  end

  def create
    create!{chat_path(@message.chat)}
  end

end
