class ArtPlansController < ApplicationController
    before_action :set_art_plan, only: [:edit, :update, :show, :delete]
    before_action :redirect_if_not_logged_in, only: [:new, :create, :edit, :update]
    before_action :require_same_user, only: [:edit, :update, :delete]
  
    def index
      @art_plans = current_user.art_plans
    end
  
    def show
    end
  
    def new
      @art_plan = ArtPlan.new
      @art_plan.art_schedules.build
      @art_project = ArtProject.new
    end
  
    def create
      @art_plan = current_user.art_plans.build(art_plan_params)
  
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
  
  
    def edit
    end
  
    def update
      if @art_plan.update(art_plan_params)
        flash[:success] = "Your changes were saved!"
        redirect_to art_plan_path(@art_plan)
      else
        render :edit
      end
    end
  
    def destroy
      @art_plan.destroy
      flash[:success] = "Your art plan and all associated art plans were deleted!"
      redirect_to art_plans_path
    end
  
  private
  
    def art_plan_params
      params.require(:art_plan).permit(:goal, :description)
    end
  
    def art_schedule_params
      params.require(:art_plan).require(:art_schedule).permit(:art_time, :art_type, :art_id,
        art_project: [:medium, :day, :idea, :artist_reference, :content, :price])
    end
  
    def set_art_plan
      @art_plan = ArtPlan.find(params[:id])
      if @art_plan.nil?
        flash[:danger] = "ART PROJECT Plan not Found!"
        redirect_to art_plans_path
      end
    end
  
    def require_same_user
      if current_user.id != @art_plan.user_id
        flash[:danger] = "You can only edit or delete your own art project plan"
        redirect_to art_plans_path
      end
    end
  end