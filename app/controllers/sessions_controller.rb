class SessionsController < ApplicationController

    def new

    end

    def create
     user = User.find_by_email(params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])
        sign_in user
        redirect_to user

      else
    #Flash.now will make sure the flash message will be shown only one time and will not pass to the next page
      flash.now[:error] = 'invalid email/password combination'
      render 'new'
      end

    end

    def destroy
      sign_out
      redirect_to root_url
    end

end





