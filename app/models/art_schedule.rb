class ArtSchedule < ApplicationRecord
    belongs_to :art_project
    belongs_to :art_plan
  
    validates :art_time, :art_type, presence: true
    default_scope -> { order(updated_at: :desc)}
  
    accepts_nested_attributes_for :art_project, reject_if: :all_blank
  
  
    def art_project=(attributes)
      self.build_art_project(attributes) unless self.art_id
    end
  end