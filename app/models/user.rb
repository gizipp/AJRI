class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true

  has_many :goals

  after_create :send_admin_mail

  def send_admin_mail
    UserMailer.delay.welcome_email(self)
  end

end
