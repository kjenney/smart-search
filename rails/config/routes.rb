Rails.application.routes.draw do
    get 'welcome/index'
  
    resources :videos
  
    root 'welcome#index'

    #get '/search/:word_1&:word_2', to: 'videos#search'
    match "search/*tags", :to => "videos#search", :via => :get
end
  