# frozen_string_literal: true

# Base Resources controller
class ApplicationController < ActionController::Base
  include JSONAPI::ActsAsResourceController
end
