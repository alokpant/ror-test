Rails.application.routes.draw do
  root 'pages#index'

  resources :tasks do
    collection do
      post :clear_completed
      post :complete_all
      post :uncomplete_all
    end

    member do
      post :mark_as_done
      post :mark_as_undone
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
