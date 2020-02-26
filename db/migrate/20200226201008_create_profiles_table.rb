# frozen_string_literal: true

class CreateProfilesTable < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :email, null: false, index: true
      t.string :token, null: true, index: false
      t.string :spotify_trackid, null: true, index: false
      t.string :spotify_trackid_waiting, null: true, index: false
      t.string :spotify_embed_url
      t.timestamps
    end
  end
end
