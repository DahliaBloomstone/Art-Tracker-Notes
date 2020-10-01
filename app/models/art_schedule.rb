class ArtSchedule < ApplicationRecord
    belongs_to :art_project
    belongs_to :art_plan
  
        #model level validations:
    validates :art_time, :art_type, presence: true
   
    # default_scope -> { order(updated_at: :desc)}
  
    accepts_nested_attributes_for :art_project, reject_if: :all_blank
  
  
    #self: defining a method of the class, not an instance
    #setter method for attributes for art projects 
    #self refers to the Art Schedule
    #Active Record Lifecycle Callback: run code when something happens in our model,
    #make sure project has attributes 
    def art_project=(attributes)
      self.build_art_project(attributes) unless self.art_project_id
    end
  end