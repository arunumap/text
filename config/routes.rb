Texthelp::Application.routes.draw do
  
  
  # Chats
  resources :chats
  
  # Messages
  resources :messages do
    match via: [:get,:post], '/incoming' => 'messages#incoming', as: :incoming, on: :collection
  end
  
  # Root Path
  root to: 'chats#index'
  
  
end
