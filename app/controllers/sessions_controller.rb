class SessionsController < ApplicationController

    def welcome
        if logged_in?
            redirect_to user_path(current_user)
        end
    end

    def new
        @user = User.new
    end

    def create

        u = User.find_by_email(params[:email])
        if u && u.authenticate(params[:password])
            session[:user_id] = u.id
            redirect_to user_path(u)
        else
            flash[:alert] = "Invalid credentials. Please try again."
            redirect_to '/login'
        end
    end

    def destroy
        session.delete(:user_id)
        redirect_to '/login'
    end


    def omniauth
        if params[:provider]== "github"
            user = User.create_from_omniauth_github(auth)
        elsif params[:provider] == "google_oauth2"
            user = User.create_from_omniauth(auth)
        end 
        
        if user.save
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            flash[:alert] = user.errors.full_messages.join(", ")
            redirect_to shoes_path
        end 
    end 

    private

    def auth
        request.env['omniauth.auth']
    end

end 