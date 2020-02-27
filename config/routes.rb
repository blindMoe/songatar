# frozen_string_literal: true

Rails.application.routes.draw do
  post 'confirm/:token' => 'profiles#confirm'

  jsonapi_resources :profiles, only: %i[confirm create index show update]
end
