class Message < ActiveRecord::Base
  
  # Attributes
  attr_accessible :from, :to, :is_incoming, :body, :chat_id
  
  # Associations
  belongs_to :chat
  
  # Callbacks
  before_create :send_message
  
  # Methods
  
  def send_message
    unless self.is_incoming?
      account_sid = 'AC7d08ed05ef894dba8d039e6ff5238d8a'
      auth_token = '92749b4da6ab89cbffc139b9b09a712d'
      @client = Twilio::REST::Client.new account_sid, auth_token
    
      @client.account.sms.messages.create(
        :from => '+16467362220',
        :to => self.to,
        :body => self.body
      )
    end
  end
  
end
