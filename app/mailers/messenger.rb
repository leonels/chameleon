class Messenger < ActionMailer::Base
  # set to web app email
  default :from => Rails.application.class.parent_name + " <leonelsantosnet@gmail.com>"
  
  # send to website owner
  # default :to => 'leonelsantos.me@gmail.com'
  # default :to => @message.to

  def website_message(website, message)

    @website = website
    @message = message
    mail(:to => message.to, :subject => "From your Website: " + website.name)

  end
  
  def website_message_thank_you(website, message)

    @website = website
    @message = message
    
    mail(:to => message.visitor_email, :subject => "Thank you for contacting us: " + website.name)

  end

end
