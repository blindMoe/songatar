# frozen_string_literal: true

# :nodoc:
class ProfilesController < ApplicationController
  attr_reader :profile

  before_action :fetch_profile_by_token, only: %i[confirm]

  def confirm
    @profile.finalize_changes
  end

  private

  def fetch_profile_by_token
    @profile = Profile.find_by(token: params[:token])
    respond_with_not_found unless params[:token] && @profile
  end
end
