class MessagesController < ApplicationController
  
  skip_before_action :verify_authenticity_token

  # POST /email
  def create
    mail = Message.new
    mail.assign_attributes(email: mail_params[:email], to_name: mail_params[:to_name], 
                        from: mail_params[:from], from_name: mail_params[:from_name],
                        subject: mail_params[:subject], body: mail_params[:body])

    if mail.valid?
      mail.body = helpers.strip_tags(mail.body)
      MailerJob.perform_later(mail)
      render json: 'Email queued to be sent', status: :ok
    else 
      render json: mail.errors, status: :unprocessable_entity
    end

  rescue ActiveRecord::ActiveRecordError => e
    render_422(e)
  end
  
  private
    
  def mail_params
    params.permit(:email, :to_name, :from, :from_name, :subject, :body)
  end
end
