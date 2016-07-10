Rails.application.routes.draw do

  get 'sessions/new'

  root 'pages#index'
  
  resources :caracteristica_releases, :only => [:new, :create, :destroy]
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
  get 'pessoa_sistema/new'
  get 'pessoa_sistemas' => 'sistema#new'
  post 'pessoa_sistemas' => 'pessoa_sistema#addpessoa'
end
