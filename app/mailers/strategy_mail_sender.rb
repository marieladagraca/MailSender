require 'httparty'

class StrategyMailSender
  
  def strategy(strategy)
    raise NotImplementedError, 'Abstract Class'
  end
  def send_email(message)
    raise NotImplementedError, 'Abstract Class'
  end

  protected

  def http_request(type, url, headers, options)

    response = case type
                when :get
                  HTTParty.get(url, options)
                when :post
                  HTTParty.post(url, options)
                when :delete
                  HTTParty.delete(url, options)
                end
    
    if response.code == 200 || response.code == 202
      response = 'Email sent'
    else
      response = response.parsed_response
    end
    response
  end
end
