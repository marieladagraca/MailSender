class Message
  include ActiveModel::Validations
  include ActiveModel::AttributeAssignment
  include ActiveModel::Model

  attr_accessor :email, :to_name, :from, :from_name, :subject, :body

  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z]+[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  validates :email, presence: true, length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX }
  validates :to_name,  presence: true
  validates :from, presence: true, length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX }
  validates :from_name,  presence: true
  validates :subject, presence: true
  validates :body, presence: true

end
