Rails.application.routes.draw do
  root 'pages#index'

  resources :tasks do
    post 'mark_as_done', action: 'mark_as_done', controller: 'tasks'
    post 'mark_as_undone', action: 'mark_as_undone', controller: 'tasks'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
