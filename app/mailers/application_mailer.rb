# app/mailers/application_mailer.rb
class ApplicationMailer < ActionMailer::Base
  default from: "from@example.com"
  layout "mailer"

  # เมธอดสำหรับทดสอบ default from
  def test_email(to:)
    mail(to: to, subject: "Test Mail") do |format|
      format.text { render plain: "Hello" }
    end
  end

  # เมธอดสำหรับทดสอบ layout
  def layout_email(to:)
    mail(to: to, subject: "Layout Test") do |format|
      format.text { render plain: "Hello Layout" }
    end
  end
end
