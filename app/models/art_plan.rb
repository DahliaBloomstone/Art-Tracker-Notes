class ArtPlan < ApplicationRecord
    belongs_to :user
    has_many :art_schedules, dependent: :destroy
    has_many :art_projects, through: :art_schedules, dependent: :destroy
  
    validates :goal, :description, presence: true
    default_scope -> { order(updated_at: :desc)}
  
  end