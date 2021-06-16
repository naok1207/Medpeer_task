# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    resource :ideas, only: %i[ show create ]
  end
end
