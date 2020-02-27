# frozen_string_literal: true

# :nodoc:
class AddSpotifyEmbedUrlWaitingToProfiles < ActiveRecord::Migration[6.0]
  def change
    add_column :profiles, :spotify_embed_url_waiting, :string
  end
end
