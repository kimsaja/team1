require 'mailgun'

class HomeController < ApplicationController
    def index
    end
    def mailpage
        @title = params[:wpahr]
        @content = params[:sodyd]
        @adress = params[:wnth]
        puts @adress
        
        mg_client = Mailgun::Client.new("key-efdbc5f18cd4ea78e1e48d1c986f71f5")

        message_params =  {
                   from: 'nb_look@naver.com',
                   to:   @adress,
                   subject: @title,
                   text:    @content
                  }

        result = mg_client.send_message('sandboxff881cc208d94cca9f792bc8cdf9d1b0.mailgun.org', message_params).to_h!

        message_id = result['id']
        message = result['message']
    end
end
