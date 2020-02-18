class MailgunSender < StrategyMailSender

   def send_email(message)
    
    url  = "https://api.mailgun.net/v3/sandbox735f50b086c34f0e967142d4ad6d77f8.mailgun.org/messages"
    
    data = {
      :from => "#{message.from_name} <#{message.from}>", 
      :to => "#{message.to_name} <#{message.email}>",
      :subject => message.subject,
      :text => message.body
    } 
    
    headers = { 
      "Content-Type" => "application/json"
    }

    auth = {
        username: "api",
        password: "#{Rails.application.credentials[:mailgun][:api_key]}"
      }

    options = { 
      header: headers,
      basic_auth: auth,
      body: data
    }

    http_request(:post, url, headers, options)
  end
end
