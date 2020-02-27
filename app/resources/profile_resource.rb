# frozen_string_literal: true

# :nodoc:
class ProfileResource < JSONAPI::Resource
  attribute :email
  attribute :spotify_embed_url_waiting
  attribute :spotify_trackid_waiting

  readonly :spotify_trackid
  readonly :spotify_embed_url

  filter :email
end
