# frozen_string_literal: true

# :nodoc:
class Profile < ApplicationRecord
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :email, uniqueness: true
  validates :token, uniqueness: true

  def update_spotify_track_id
    update_column :spotify_trackid, spotify_trackid_waiting
  end
end
