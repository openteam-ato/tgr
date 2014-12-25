Tgr::Application.routes.draw do
  mount ElVfsClient::Engine => '/'

  namespace :manage do
    resource :opendata do
      resources :datasets
    end

    root :to => 'opendata#index'
  end

  get '/opendata' => 'opendata#show'
  get '/opendata/:id' => 'dataset#show'
  get '/opendata/:id/:file' => 'dataset#file'

  get '/(*path)', :to => 'main#index'
end
