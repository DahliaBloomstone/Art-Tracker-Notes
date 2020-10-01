class UsersController < ApplicationController
   #Filter: requires the user to be logged in 
   #all controllers in the application inherit this method 
  before_action :redirect_if_not_logged_in, only: [:show]
  
  #create a new user, save them, show page, require email/ password
  
  def new
      @user = User.new
    end
  
    def create
      @user = User.new(user_params)
      if @user.save
        flash[:success] = "Welcome #{@user.name} to Art Tracker!"
        session[:user_id] = @user.id
        redirect_to user_path(@user) 
      else
        render :new
      end
    end
  
    def show
      @user = User.find_by_id(params[:id])
      @user_artplans = @user.art_plans.paginate(page: params[:page], per_page: 2)
    end
  
  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
  end