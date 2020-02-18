class MailerJob < ApplicationJob
  queue_as :default
  sidekiq_options retry: 3

  def perform(message)
    mailer = Mailer.new
    mailer.send_email(message)
  end
end
