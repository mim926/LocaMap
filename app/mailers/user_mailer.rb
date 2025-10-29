class UserMailer < ApplicationMailer
  def test_email(to)
    mail(to: to, subject: "テスト", body: "テストですよ")
  end
end
