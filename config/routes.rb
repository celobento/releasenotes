Rails.application.routes.draw do

  root 'sessions#new'
  
  resources :release_notes
  
  resources :caracteristica_releases
  resources :integracoes, :only => [:new, :create, :destroy]
  resources :observacoes
  resources :tipo_integracoes
  resources :defeitos
  resources :pessoas
  resources :sistemas
  resources :caracteristicas
  
  resources :perfis
  resources :usuarios
  
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  get    'signup'  => 'sessions#signup'
  get    'reset'   => 'sessions#reset'
  delete 'logout'  => 'sessions#destroy'
  
  
  get 'sessions/new'
  get 'sessions/new' , :as => 'new_session'
  get 'pessoa_sistema/new'
  get 'pessoa_sistema' => 'pessoa_sistema#index'
  get 'pessoa_sistemas' => 'sistema#new'
  post 'pessoa_sistemas' => 'pessoa_sistema#addpessoa'
  
end