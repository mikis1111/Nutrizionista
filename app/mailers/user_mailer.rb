class UserMailer < ApplicationMailer
    def welcome_email(user)
      @user = user
      mail(to: @user.email, subject: 'Benvenuto su Studio Vitale!')
    end
  end
  