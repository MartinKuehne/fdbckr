class MailRequestsController < ApplicationController
  
  def invite_externals
    # if the submit button has been pushed
    @artwork = Artwork.find(params[:artwork_id])
    @message = params[:mail_request][:message]
    @emails = params[:emails]

    @emails.each do |mail|
      MailRequestMailer.with(artwork: @artwork, message: @message, email: mail).new_mail_request_email.deliver_now
    end

    flash.notice = "Your feedbacker request has been sent"
    redirect_to artwork_path(@artwork)
  end
end
