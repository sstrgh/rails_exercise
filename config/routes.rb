Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'developers#index'
  get "developers", to: "developers#index", as: :developers

end
