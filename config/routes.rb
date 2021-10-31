# frozen_string_literal: true

Rails.application.routes.draw do
  resources :companies do
    resources :employees
  end

  resources :employees

  root to: 'companies#index'
end
