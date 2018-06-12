class UserMailer < ApplicationMailer
  def account_activation user, token
    @user = user
    @token = token
    mail to: user.email, subject: t(".account_activation")
  end

  def info_password_google user
    @user = user
    mail to: user.email, subject: t(".info_password")
  end
end
