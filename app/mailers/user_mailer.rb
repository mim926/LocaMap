class UserMailer < ApplicationMailer
  default from: "locamap.m@gmail.com"

  def test_email(user)
    @user = user
    mail(to: @user.email, subject: "テストメールです")
  end
end
