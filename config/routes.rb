Rails.application.routes.draw do
  resources :projects

  root to: 'welcome#index'
end
