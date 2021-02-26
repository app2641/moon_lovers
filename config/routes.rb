# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'moon_age/tonights#show'

  namespace :moon_age do
    resource :tonight, only: :show, default: { format: :json }
  end
end
