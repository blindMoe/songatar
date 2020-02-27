# frozen_string_literal: true

# Base Resources controller
class ApplicationController < ActionController::Base
  include JSONAPI::ActsAsResourceController

  protect_from_forgery with: :null_session

  def respond_with_bad_request(error)
    @status  = 400
    @message = I18n.t('errors.bad_request')
    if error.message != error.class.name
      @errors = [
        JsonApiError.new({
          title:  @error,
          detail: error.message,
          status: @status
        })
      ]
    end

    render 'errors/json_api_error.json', status: @status
  end

  def respond_with_access_denied
    @status  = 401
    @message = I18n.t('errors.access_denied')

    render 'errors/json_api_error.json', status: @status
  end

  def respond_with_forbidden
    @status  = 403
    @message = I18n.t('errors.forbidden')

    render 'errors/json_api_error.json', status: @status
  end

  def respond_with_not_found
    @status  = 404
    @message = I18n.t('errors.not_found')

    render 'errors/json_api_error.json', status: @status
  end

  def respond_with_unknown_format(*)
    @status  = 406
    @message = I18n.t('errors.invalid_format')

    render 'errors/json_api_error.json', status: @status
  end

  def respond_with_json_api_errors(args = {})
    @status  = args[:status] || 400
    @errors  = Array(args[:errors])

    render 'errors/json_api_error.json', status: @status
  end

  def respond_with_model_errors(model)
    errors = model.errors.map do |field, msg|
      JsonApiError.new({
        title:  I18n.t('errors.bad_request'),
        detail: msg,
        status: 400,
        source: { pointer: "data/#{field}" }
      })
    end
    respond_with_json_api_errors(errors: errors, status: 400)
  end

end
