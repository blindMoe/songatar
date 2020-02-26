# frozen_string_literal: true

# :nodoc:
class ProfileController < ApplicationController
  attr_reader :profile

  before_action :fetch_profile_by_email, only: %i[update]
  before_action :fetch_profile_by_token, only: %i[confirm]

  def confirm
    params[:spotify_trackid]
  end

  def update
    create_profile_from_params unless @profile.present?
  end

  private

  def fetch_profile_by_email
    return false unless params[:email].present?

    @profile = Profile.find_by(email: params[:email])
  end

  def fetch_profile_by_token
    return false unless params[:token].present?

    @profile = Profile.find_by(token: params[:token])
  end

  def create_profile_from_params
    email = params[:email]
    track_id = params[:track_id]
    preview_url = params[:preview_url]

    return false unless email && track_id && preview_url

    @profile = Profile.create(email: email, spotify_trackid: track_id, spotify_embed_url: preview_url)
  end

  def generate_token
    SecureRandom.urlsafe_base64(32)
  end
end
