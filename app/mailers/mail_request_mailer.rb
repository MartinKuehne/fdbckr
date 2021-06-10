class MailRequestMailer < ApplicationMailer
  
  def new_mail_request_email
    @message = params[:message]
    @artwork = params[:artwork]
    email = params[:email]
    @artwork_path = params[:artwork_path]
    mail(to: email, subject: "You got a new feedback request on Fdbckr")
  end
end
