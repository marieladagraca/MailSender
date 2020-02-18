class MessageSerializer < ActiveJob::Serializers::ObjectSerializer
  
  def serialize?(argument)
    argument.kind_of?(Message)
  end

  def serialize(message)
    super(
      'email' => message.email, 
      'to_name' => message.to_name, 
      'from' => message.from,
      'from_name' => message.from_name, 
      'subject' => message.subject, 
      'body' => message.body
    )
  end

  def deserialize(hash)
    message = Message.new
    message.email = hash['email']
    message.to_name = hash['to_name']
    message.from = hash['from']
    message.from_name = hash['from_name']
    message.subject = hash['subject']
    message.body = hash['body']
    message
  end
end