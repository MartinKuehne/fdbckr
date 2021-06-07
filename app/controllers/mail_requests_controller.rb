class MailRequestsController < ApplicationController
  
  def invite_externals
    # if the submit button has been pushed
    @artwork = Artwork.find(params[:id])
    @message = ""
    MailRequestMailer.with(artwork: @artwork, message: @message).new_mail_request_email.deliver_later
  end
end
