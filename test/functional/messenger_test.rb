require 'test_helper'

class MessengerTest < ActionMailer::TestCase
  test "website_message" do
    mail = Messenger.website_message
    assert_equal "Website message", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
