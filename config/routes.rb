Rails.application.routes.draw do
  namespace :api do
    resource :ideas, only: :create
    resource :categories, only: %i[ show ]
  end
end
