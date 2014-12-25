Tgr::Application.routes.draw do
  mount ElVfsClient::Engine => '/'

  namespace :manage do
    resource :opendata do
      resources :datasets
    end

    root :to => 'opendata#index'
  end

  resources :opendata

  get '/(*path)', :to => 'main#index'
end
