require "test_helper"

class ApplicationMailerTest < ActionMailer::TestCase
  # Test default from address
  test "default from address" do
    mail = ApplicationMailer.test_email(to: "test@example.com")

    assert_equal [ "from@example.com" ], mail.from
    assert_equal [ "test@example.com" ], mail.to
    assert_equal "Test Mail", mail.subject
    assert_equal "Hello", mail.body.to_s
  end

  # Test that layout is applied
  test "uses mailer layout" do
    mail = ApplicationMailer.layout_email(to: "test@example.com")

    assert_equal [ "from@example.com" ], mail.from
    assert_equal [ "test@example.com" ], mail.to
    assert_equal "Layout Test", mail.subject
    assert_match /Hello Layout/, mail.body.to_s
  end
end
