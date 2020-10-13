class ArtProject < ApplicationRecord
    has_many :art_schedules
    has_many :art_plans, through: :art_schedules
  

        #model level validations:
    validates :medium, :day, :idea, :artist_reference, :content, :price, presence: true

    
      scope :order_projects, -> { order(created_at: :desc)}
      scope :search_function,  -> (search) {where("medium LIKE ?", "%" + search + "%") }
  end