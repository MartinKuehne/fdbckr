class MailRequestsController < ApplicationController
  
  def invite_externals
    # if the submit button has been pushed
    @artwork = Artwork.find(params[:artwork_id])
    @message = params[:mail_request][:message]
    @emails = params[:emails]
    
    if @emails
      @emails.each do |mail|
        MailRequestMailer.with(artwork: @artwork, message: @message, email: mail).new_mail_request_email.deliver_now
        flash.notice = "Your feedbacker request has been sent"
      end
    end

    redirect_to artwork_path(@artwork)
  end
end
