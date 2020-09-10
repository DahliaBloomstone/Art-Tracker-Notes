class User < ApplicationRecord
    has_secure_password
    has_many :art_plans
    has_many :art_projects, through: :art_plans
    has_many :art_schedules, through: :art_projects
  
    validates :name, :email, presence: true
    validates :email, uniqueness: true
  
  end