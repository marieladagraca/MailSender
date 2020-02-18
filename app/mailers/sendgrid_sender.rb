class SendgridSender < StrategyMailSender

  def send_email(message)
    url  = "https://api.sendgrid.com/v3/mail/send"
    
    data = {
      "personalizations": [
        {
          "to": [
            {
              "email": message.email,
              "name": message.to_name
            }
          ],
          "subject": message.subject
        }
      ],
      "from": {
        "email": message.from,
        "name": message.from_name
      },
      "content": [
        {
          "type": "text/plain",
          "value": message.body
        }
      ]
    } 
    
    headers = { 
      "Content-Type" => "application/json",
      "Authorization" => "Bearer #{ Rails.application.credentials[:sendgrid][:api_key] }"
    }
      
    options = { 
      headers: headers,
      body: data.to_json
    }

    http_request(:post, url, headers, options)
  end
end
