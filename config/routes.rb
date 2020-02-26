# frozen_string_literal: true

Rails.application.routes.draw do
  jsonapi_resources :profiles, only: %i[confirm create index show update]
end
