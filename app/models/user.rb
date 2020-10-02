class User < ApplicationRecord
  
  #Adds methods to set and authenticate against a BCrypt password. T
  #his mechanism requires you to have a password_digest attribute.
  has_secure_password
   
    has_many :art_plans
    has_many :art_projects, through: :art_plans
    has_many :art_schedules, through: :art_projects
  
    #validates email uniqueness so two accounts cannot have the same email, will cause an error
    validates :name, :email, presence: true
    validates :email, uniqueness: true
  
  end