require 'test_helper'

class MailerTest < ActionMailer::TestCase
  test "contact_email" do
    @expected.subject = 'Mailer#contact_email'
    @expected.body    = read_fixture('contact_email')
    @expected.date    = Time.now

    assert_equal @expected.encoded, Mailer.create_contact_email(@expected.date).encoded
  end

end
