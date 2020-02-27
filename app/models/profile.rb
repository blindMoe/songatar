# frozen_string_literal: true

# :nodoc:
class Profile < ApplicationRecord
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :email, presence: true, uniqueness: true

  def build_update_url
    working_token = retrieve_or_create_token
    "http://localhost:3000/whatever?token=#{working_token}"
  end

  def retrieve_or_create_token
    return token if token.present?

    update_column(:token, SecureRandom.urlsafe_base64(32))
    token
  end

  def update_spotify_track_id
    update_column :spotify_trackid, spotify_trackid_waiting
  end
end
