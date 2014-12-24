Tgr::Application.routes.draw do
  mount ElVfsClient::Engine => '/'

  namespace :manage do
    resource :opendata

    root :to => 'opendata#index'
  end

  resources :opendata

  get '/(*path)', :to => 'main#index'
end
