class ArtProjectsController < ApplicationController 
   #filters: methods that are run before, after, or around a controller action
   #filters are inherited 
   #art project method to show edit or update
    before_action :set_art_project, only: [:show, :edit, :update]

    #index action 
    #this action matches art plan parameters
    #instance variable art project object to store art proj data are available in the views 
    # will_paginate is a pagination library that integrates with Ruby on Rails, Sinatra, Hanami::View, Merb, DataMapper and Sequel. 
    #storing art plans in art projects, ensuring the current user 
    def index 
    if params[:art_plan_id] && artplan = ArtPlan.find_by_id(params[:art_plan_id])
    @art_projects = artplan.art_projects.paginate(page: params[:page], per_page: 2)
    else
     @art_projects = current_user.art_projects.paginate(page: params[:page], per_page: 2)
     end
end 

    def show 
    end 

    def edit
    end 

    #update action to update a current art project
    #ensures user is logged in to update their art project 
    #can edit the art project
    def update 
        set_art_project
        redirect_if_not_logged_in 
        if @art_project.update(art_project_params)
            flash[:success] = "Your art project has been updated!"
            redirect_to art_project_path(@art_project)
        else 
            render :edit 
        end 
    end 

#private method for internal usage
#must be called within a public method, called with self
#By having LESS public methods you INCREASE the freedom of change inside your class.

    private 
    #art projects require medium, day, idea, etc parameters 
    def art_project_params 
        params.require(:art_project).permit(:medium, :day, :idea, :artist_reference, :content, :price)
    end 

    #find an art project by its id, will flash a message if not found by id
    def set_art_project 
        @art_project = ArtProject.find_by(id: params[:id])
        if !@art_project 
            flash[:dancer] = "Art Project Not Found! Try Again!"
            redirect_to art_projects_path 
        end 
    end 

    
end

# will_paginate is a pagination library that integrates with Ruby on Rails, Sinatra, Hanami::View, Merb, DataMapper and Sequel.
#Installation:
## Gemfile for Rails 3+, Sinatra, and Merb
#gem 'will_paginate', '~> 3.1.0'