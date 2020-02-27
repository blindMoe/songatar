# frozen_string_literal: true

# :nodoc:
class ConfirmationMailer < ApplicationMailer
  def confirm(profile)
    @profile = profile
    @url = profile.build_update_url

    mail(to: profile.email, subject: 'Confirm your Songatar changes')
  end
end
