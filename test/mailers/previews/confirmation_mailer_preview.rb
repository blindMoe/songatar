# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/confirmation_mailer
class ConfirmationMailerPreview < ActionMailer::Preview
  def confirm
    @profile = Profile.new(
      email: 'test@songatar.com',
      spotify_trackid: '1231231234',
      spotify_embed_url: 'https://www.google.com'
    )

    @url = @profile.build_update_url
  end
end
