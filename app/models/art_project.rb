class ArtProject < ApplicationRecord
    has_many :art_schedules
    has_many :art_plans, through: :art_schedules
  
    validates :medium, :day, :idea, :artist_reference, :content, :price, presence: true

    default_scope -> { order(updated_at: :desc)}
  end