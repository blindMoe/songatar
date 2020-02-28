# frozen_string_literal: true

# :nodoc:
class ProfileResource < ApplicationResource
  attribute :email
  attribute :spotify_embed_url
  attribute :spotify_embed_url_waiting
  attribute :spotify_trackid
  attribute :spotify_trackid_waiting

  filter :email

  after_update :send_confirmation

  private

  def send_confirmation
    ConfirmationMailer.confirm(@model).deliver_now
  end
end
