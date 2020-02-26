# frozen_string_literal: true

# :nodoc:
class ProfileResource < JSONAPI::Resource
  attribute :email
  attribute :spotify_embed_url
  attribute :spotify_trackid
end
