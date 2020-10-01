class ArtSchedulesController < ApplicationController 
    #FILTERS:
    before_action :set_art_schedules, only: [:edit, :update, :show, :destroy]
    before_action :redirect_if_not_logged_in, only: [:new, :create, :edit, :update]
    before_action :require_same_user, only: [:edit, :update, :delete]

    #index action 
    #this action matches art schedule parameters
    #instance variable art schedule object to store art proj data and art scheudle data are available in the views 
    # will_paginate is a pagination library that integrates with Ruby on Rails, Sinatra, Hanami::View, Merb, DataMapper and Sequel. 
    #storing art scchedules in art schedule @instance variable, ensuring the current user 
    def index 
     if params[:art_project_id] && art_project = ArtProject.find_by_id(params[:art_project_id])
      @art_schedules = art_project.art_schedules.paginate(page: params[:page], per_page: 2)
        else
     @art_schedules = current_user.art_schedules.paginate(page: params[:page], per_page: 2)
        end
    end 

    #create a new art schedule ensuring current user art right art plan id 
    #if correct/valid, can build a new art project and store it in art schedule 
    #or create a new art schedule
    def new 
        if current_user && params[:art_plan_id] && @artplan = ArtPlan.find_by_id(params[:art_plan_id])
     @art_schedule = @artplan.art_schedules.build
     @art_schedule.build_art_project
         else
     @art_schedule = ArtSchedule.new
     @art_schedule.build_art_project
        end
    end 

    #create action, will save new art schedule
    def create
        @art_schedule = ArtSchedule.new(art_schedule_params)
      if @art_schedule.save
        flash[:success] = "Your art project schedule has been created! Start Working!"
        redirect_to art_schedule_path(@art_schedule)
      else
        render :new
      end
    end 

    def show
    end 

    def edit 
    end 

    #can update art schedule with the correct params ()
    #params: art project time and art project type 
    #ability to edit
    def update
   if @art_schedule.update(art_schedule_params)
     flash[:success] = "Your art project schedule has been updated!"
     redirect_to art_schedule_path(@art_schedule)
     else
  render :edit
        end
    end 

    #can destroy/delete
    def destroy 
    @art_schedule.destroy
    flash[:success] = "You have successfully deleted this art schedule!"
    redirect_to art_schedules_path
    end 

    #method to ensure correct parameters are submittted
    #params art time and art type
    #also renders all art project details to the page
    #so when you see art project scheduling page: shows details of art project and art schedule
    private  
    def art_schedule_params
    params.require(:art_schedule).permit(:art_time, :art_type, :art_id, :art_plan_id, art_attributes: [:medium, :idea, :artist_reference, :day, :content, :price])
    end 

    #method to match instance variable with class ArtSchedule and find it by its params
    #if it doesn't exists, will flash a message and redirect
    def set_art_schedules 
        @art_schedule = ArtSchedule.find_by(id: params[:id])
        if @art_schedule.nil?
          flash[:danger] = "This Art Project Schedule is not Found! Try Something Else!"
          redirect_to art_schedules_path
        end
    end 

    #cannot edit or delete an art schedule if you are not the current user
    def require_same_user 
        set_art_schedules
        if current_user.id != @art_schedule.art_plan.user_id
          flash[:danger] = "You can only edit or delete your own art project schedule"
          redirect_to art_schedules_path
      end
    end 
    
end 