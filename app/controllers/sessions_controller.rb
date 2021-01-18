class SessionsController < ApplicationController

    def home
    end

    def new
        @user = User.new
    end

    def create 
        user = User.find_by(email:params['user']['email'])
        if user && user.authenticate(params['user']['password'])
            session[:user_id] = user.id
            redirect_to user_path(user)
        else 
            flash[:message] = "Email or Password does not match our records. Please try again."
            render :new
        end
    end

    def destroy
        session.delete :user_id
        redirect_to :root
    end
end