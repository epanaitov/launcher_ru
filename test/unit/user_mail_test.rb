require 'test_helper'

class UserMailTest < ActionMailer::TestCase
  test "welcome_email" do
    @expected.subject = 'UserMail#welcome_email'
    @expected.body    = read_fixture('welcome_email')
    @expected.date    = Time.now

    assert_equal @expected.encoded, UserMail.create_welcome_email(@expected.date).encoded
  end

end
