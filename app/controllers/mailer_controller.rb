class MailerController < ApplicationController
  require 'mailgun'
  
  def new
    
  end
  
  def sendmail
    email = params[:mailer][:email]
    subject = params[:mailer][:subject]
    message = params[:mailer][:message]
    
    # First, instantiate the Mailgun Client with your API key
    mg_client = Mailgun::Client.new 'key-9793adf968a4fb57cc6f619b58b98d4c'
    
    # Define your message parameters
    message_params =  { from: 'Fidiyo App <app@fidiyo.com>',
                        to: email,
                        subject: subject,
                        text: message
                      }
    
    # Send your message through the client
    result = mg_client.send_message('idevia.in', message_params).to_h!
    
    puts result
    
    if result
      flash[:success] = "Email has been sent"
    end
    
    render 'new'

  end
  
end