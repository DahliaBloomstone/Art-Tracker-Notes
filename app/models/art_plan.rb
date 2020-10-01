class ArtPlan < ApplicationRecord
    belongs_to :user

    #dependent: :destroy: objects will be destroyed if they're associated with this 
    #using destroy method in controller
    has_many :art_schedules, dependent: :destroy
    has_many :art_projects, through: :art_schedules, dependent: :destroy
  
    #model level validations:
    #presence: true validates if an object is valid
    #active record performs the validations
    #ex: Person.create(:goal => "Finish project", :description => "fun").valid? => true
    validates :goal, :description, presence: true
    
    #default scope: alters default state of models so they go in descending order
    #default_scope -> { order(updated_at: :desc)}

  end


  #FOREIGN KEYS. 
  #Columns that refer to the primary key of another table. 
  #Comprised of the name of the model you are referencing and id. 
  #Accessible through instance methods like ArtPlan.find(@art_plan.art_plan_id) would mean you could find an art plans with that active record query. by their id. Foreign keys correspond to the belongs to, has many, has many through relationships 
