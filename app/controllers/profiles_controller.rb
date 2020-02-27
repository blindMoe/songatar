# frozen_string_literal: true

# :nodoc:
class ProfilesController < ApplicationController
  attr_reader :profile

  before_action :fetch_profile_by_email, only: %i[update]
  before_action :fetch_profile_by_token, only: %i[confirm send_confirmation]

  def confirm
    @profile.finalize_changes
  end

  def send_confirmation
    ConfirmationMailer.confirm(@profile)
  end

  private

  def fetch_profile_by_email
    @profile = Profile.find_by(email: params[:email])
    respond_with_not_found unless params[:email] && @profile.present?
  end

  def fetch_profile_by_token
    @profile = Profile.find_by(token: params[:token])
    respond_with_not_found unless params[:token] && @profile.present?
  end
end
