Tgr::Application.routes.draw do

  put '/ali.txt' => redirect('http://alihack.com')

  mount ElVfsClient::Engine => '/'

  namespace :manage do
    resource :opendata do
      resources :datasets
    end

    resources :opendata_categories, :except => :show

    root :to => 'opendata#index'
  end

  get '/opendata' => 'opendata#show'
  get '/opendata/:id' => 'dataset#show'
  get '/opendata/:id/:file' => 'dataset#file'
  post '/opendata/:id' => 'dataset#send_message', :as => :dataset

  get '/(*path)', :to => 'main#index'
end
