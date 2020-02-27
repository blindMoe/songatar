# frozen_string_literal: true

# :nodoc:
class Profile < ApplicationRecord
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :email, presence: true, uniqueness: true

  before_save :ensure_token_exists

  def confirmation_url
    front_end_url = ENV['FRONT_END_URL']
    "#{front_end_url}confirm/#{token}"
  end

  def ensure_token_exists
    return if token.present?

    self.token = SecureRandom.urlsafe_base64(32)
  end

  def finalize_changes
    update_columns(
      spotify_trackid:   spotify_trackid_waiting,
      spotify_embed_url: spotify_embed_url_waiting
    )
  end
end
