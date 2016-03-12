class Message < MailForm::Base

	attribute :name
  attribute :email
  attribute :subject
  attribute :message
  attribute :nickname,  captcha: true

  validates_presence_of :name
  validates_presence_of :email
  validates :message, presence: true, length: 1..500
  validates :email, format: {with: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i}

  def headers 
  	{
  		subject: 'Wiadomość z portfolio',
  		to: 'dawid0000@gmail.com',
  		from: %("#{name}" <#{email}>)
  	}
	end
end