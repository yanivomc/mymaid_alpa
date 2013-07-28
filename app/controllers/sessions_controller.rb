class SessionsController < ApplicationController

    def new

    end

    def create
      # Check if User is trying to login or a professional by checking the hidden input "source" from the form

      if params[:session][:source] == "user"
      user = User.find_by_email(params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])
        sign_in user
        redirect_to user

      else
    #Flash.now will make sure the flash message will be shown only one time and will not pass to the next page
      flash.now[:error] = 'invalid email/password combination'
      render 'new'
      end
      else

        professional = Professional.find_by_email(params[:session][:email].downcase)
        if professional && professional.authenticate(params[:session][:password])
          sign_in_professional professional
          redirect_to professional

        else
          #Flash.now will make sure the flash message will be shown only one time and will not pass to the next page
          flash.now[:error] = 'invalid email/password combination'
          render 'new_professional'
        end

      end

    end


      def create_facebook
        user = User.from_omniauth(env["omniauth.auth"])
       # session[:user_id] = user.id
        sign_in user
        redirect_to user
      end

      #def destroy
     #   session[:user_id] = nil
      #  redirect_to root_url
     # end

    def destroy
      sign_out
      redirect_to root_url
    end

end





