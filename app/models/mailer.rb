class Mailer < ActionMailer::Base

  def contact_email(email, message, sent_at = Time.now)
    subject    'launcha.ru - contact form submitted'
    recipients 'eugene@launcha.ru'
    from       email
    sent_on    sent_at
    
    body       message
  end

end
