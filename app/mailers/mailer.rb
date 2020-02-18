class Mailer
  attr_accessor :mailer

  def initialize()
    strategy = Rails.configuration.mail_strategy
    case strategy.to_sym
      when :sendgrid
        @mailer = SendgridSender.new
      else :mailgun
        @mailer = MailgunSender.new
      end
  end

  def send_email(message)
    @mailer.send_email(message)
  end
end