Rails.application.routes.draw do
  resources :defeitos
  resources :release_notes
  root 'pages#index'
  
  resources :pessoas
  resources :sistemas
  resources :caracteristicas
  
  get 'pessoa_sistema/new'
  get 'pessoa_sistema/new'
  get 'pessoa_sistemas' => 'sistema#new'
  post 'pessoa_sistemas' => 'pessoa_sistema#addpessoa'
end
