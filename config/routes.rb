Rails.application.routes.draw do

  get 'sessions/new'

  root 'pages#index'
  
  resources :caracteristica_releases
  
  resources :integracoes, :only => [:new, :create, :destroy]
  resources :observacoes
  resources :tipo_integracoes
  resources :defeitos
  resources :release_notes
  
  resources :pessoas
  resources :sistemas
  resources :caracteristicas
  
  get 'sessions/new' , :as => 'new_session'
  get 'pessoa_sistema/new'
  get 'pessoa_sistema' => 'pessoa_sistema#index'
  get 'pessoa_sistemas' => 'sistema#new'
  post 'pessoa_sistemas' => 'pessoa_sistema#addpessoa'
  
  get 'login' => 'sessions#new'
  get 'signup' => 'sessions#signup'
end
