class Mailer
  
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming
  
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :email, presence: true,
            length: { maximum: 120 },
            format: { with: VALID_EMAIL_REGEX }
            
  validates :subject, presence: true, length: { maximum: 50 }
  
  validates :message, presence: true, length: { maximum: 500 }
  
  def persisted?
    false
  end
  
end