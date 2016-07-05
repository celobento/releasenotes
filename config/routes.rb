Rails.application.routes.draw do
  
  root 'pages#index'
  
  resources :integracoes, :only => [:new, :create, :destroy]
  resources :observacoes
  resources :tipo_integracoes
  resources :defeitos
  resources :release_notes
  
  resources :pessoas
  resources :sistemas
  resources :caracteristicas
  
  get 'pessoa_sistema/new'
  get 'pessoa_sistema/new'
  get 'pessoa_sistemas' => 'sistema#new'
  post 'pessoa_sistemas' => 'pessoa_sistema#addpessoa'
end
