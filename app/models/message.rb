class Message < MailForm::Base

	attribute :name
  attribute :email
  attribute :subject
  attribute :message
  attribute :nickname,  captcha: true

  validates_presence_of :name, :message => "Imię nie może być puste"
  validates_presence_of :email, :message => "Email nie może być pusty"
  validates_presence_of :message, :message => "Wiadomość nie może być pusta"
  validates :email, format: {with: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i, message: 'To nie jest prawidłowy email'}

  def headers 
  	{
  		subject: 'Wiadomość z portfolio',
  		to: 'dawid0000@gmail.com',
  		from: %("#{name}" <#{email}>)
  	}
	end
end