class Chat < ActiveRecord::Base
  
  # Attributes
  attr_accessible :phone_number, :name, :status
  
  # Associations
  has_many :messages
  belongs_to :admin_numbers
  
end
