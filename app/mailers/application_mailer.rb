# frozen_string_literal: true

# :nodoc:
class ApplicationMailer < ActionMailer::Base
  default from: 'sean@songatar.com'
  layout 'mailer'
end
