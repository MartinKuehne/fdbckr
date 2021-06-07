class MailRequestMailer < ApplicationMailer
  def new_mail_request_email
    @mail_request = params[:mail_request]
    
    emails.each do |email|
      mail(to: email, subject: You got a new feedback request on Fdbckr)
    end
  end
end
