class SessionsController < ApplicationController
    #generates a session key in HTTP cookies
  require 'securerandom'
  
  #destroy session/clears session if you are logged out
    def destroy
      session.clear
      flash[:success] = "You have logged out"
      redirect_to '/'
    end
  
    #creats a new session is you create an account
    def new
      @user = User.new
      render :login
    end
  
    #you create an account by email and password
    #authenticates your password using AR authenticate 
    #authenticate returns the user if correct, and false if not
    def create
      @user = User.find_by(email: params[:user][:email])
      if @user && @user.authenticate(params[:user][:password]) && @user.authenticate(params[:user][:password_confirmation])
        session[:user_id] = @user.id
        flash[:success] = "Welcome back #{@user.name}!"
        redirect_to user_path(@user)
      else
        flash[:error] = "Sorry, there was an error with your account!"
        redirect_to '/login'
      end
    end
  
    #can login with facebook using omniauth
    def fbcreate
      @user = User.find_or_create_by(uid: auth['uid']) do |u|
        u.name = auth['info']['name']
        u.email = auth['info']['email']
        u.password = SecureRandom.hex(10)
      end
        session[:user_id] = @user.id
        flash[:success] = "Welcome back #{@user.name}!"
        redirect_to user_path(@user)
    end
  
    def home
      redirect_to art_plans_path if logged_in?
    end
  
    private
      def auth
        request.env['omniauth.auth']
      end
    end