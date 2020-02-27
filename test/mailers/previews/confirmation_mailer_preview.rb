# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/confirmation_mailer
class ConfirmationMailerPreview < ActionMailer::Preview
  def confirm
    @profile = Profile.new(
      email: 'test@songatar.com',
      spotify_trackid: '1231231234',
      spotify_embed_url: 'https://www.google.com',
      token: SecureRandom.urlsafe_base64(32)
    )

    @url = @profile.confirmation_url
  end
end
