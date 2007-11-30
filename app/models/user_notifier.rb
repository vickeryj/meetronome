class UserNotifier < ActionMailer::Base
  def signup_notification(user)
    setup_email(user)
    @subject    += 'Welcome to Meetronome!'
    @body[:url]  = "http://meetronome.com"
  end
  
  def activation(user)
    setup_email(user)
    @subject    += 'Your account has been activated!'
    @body[:url]  = "http://YOURSITE/"
  end
  
  
  #need to add a template for this one to work
  def invite(email, user)
    @recipients = "#{email}"
    @from = "pdamer@gmail.com"
    @subject = "#{user.name} has invited you to Meetronome!"
    @sent_on = Time.now
    @body[:user] = user
  end
    
  protected
  def setup_email(user)
    @recipients  = "#{user.email}"
    @from        = "pdamer@gmail.com"
    @subject     = "[Meetronome] "
    @sent_on     = Time.now
    @body[:user] = user
  end
end
