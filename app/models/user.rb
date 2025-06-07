class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

    has_many :contents  
    after_create :send_welcome_email


    def admin?
      email == "francescavitaledbm@gmail.com"
    end

    private

    def send_welcome_email
      UserMailer.welcome_email(self).deliver_now
    end
    
end
