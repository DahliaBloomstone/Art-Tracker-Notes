class ArtPlansController < ApplicationController
  #lifecycle methods (CRUD): Active Record callbacks, trigger logic, use macro class methods to "register" them (below)
  #code that will run whenever an AR object is created, updated, deleted etc. 
  #FILTERS:
    before_action :set_art_plan, only: [:edit, :update, :show, :destroy]
    before_action :redirect_if_not_logged_in, only: [:new, :create, :edit, :update]
    before_action :require_same_user, only: [:edit, :update, :delete]
  
    #index action to display current users art plans
    def index
      @art_plans = current_user.art_plans
    end
  
    def show
    end
  
    #creating a new art plan and storing art projects/art schedules in our art plans
     #new action: store art plan and art project record in an instance variable
    def new
      @art_plan = ArtPlan.new
      @art_plan.art_schedules.build
      @art_project = ArtProject.new
      #byebug
    end
  
    #create action to build an art plan if you are the current user
    #save the art plan with the art schedule 
    #or the option to create a new one
    def create
      @art_plan = current_user.art_plans.build(art_plan_params)
      #byebug
  
      if @art_plan.save
        flash[:success] = "Your art plan was created!"
        as = ArtSchedule.new(art_schedule_params)
        as.art_plan = @art_plan
        as.save
        redirect_to art_plan_path(@art_plan)
      else
        render :new
      end
    end
  
  #edit action
    def edit
    end
  
    #art plan action store ArtPlan record
    #in the instance variable art_plan
    #have access to ArtPlan object stored in @art_plan
    def update
      if @art_plan.update(art_plan_params)
        flash[:success] = "Your changes were saved!"
        redirect_to art_plan_path(@art_plan)
      else
        render :edit
      end
    end
  
    #https://stackoverflow.com/questions/13275814/undefined-method-destroy-for-nilnilclass
    #active record destroy method 
    def destroy
      #@art_plan = ArtPlan.find(params[:id])
      #if @art_plan.present?
      #byebug
      @art_plan.destroy 
      #end 
      flash[:success] = "Your art plan and all associated art plans were deleted!"
      redirect_to art_plans_path
    end
  
    #strong params for security vulnerabilities
    #use permit method so the params hash can have whatever keys are in it
  private
  #art plan parameters (attributes), an art plan has a goal and description
    def art_plan_params
      params.require(:art_plan).permit(:goal, :description)
    end
  
    #these are the art schedule parameters set in the database schema
    #an art schedule requires an art plan, art time, art type, and id
    #an art schedule requries an art project: medium, day, idea, artist reference, content, and price
    def art_schedule_params
      params.require(:art_plan).require(:art_schedule).permit(:art_time, :art_type, :art_id,
        art_project: [:medium, :day, :idea, :artist_reference, :content, :price])
    end
  
    #if art plan is empty or cannot be found by id, flash message and redirect
    def set_art_plan
      @art_plan = ArtPlan.find(params[:id])
      #byebug
      if @art_plan.nil?
        flash[:danger] = "ART PROJECT Plan not Found!"
        redirect_to art_plans_path
      end
    end
  
    #can only be logged in as the current user to edit own art plans
    def require_same_user
      if current_user.id != @art_plan.user_id
        flash[:danger] = "You can only edit or delete your own art project plan"
        redirect_to art_plans_path
      end
    end
  end