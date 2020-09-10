class CreateArtSchedules < ActiveRecord::Migration[5.2]
    def change
      create_table :art_schedules do |t|
        t.string :art_time
        t.string :art_type 
        t.references :art, foreign_key: true
        t.references :art_plan, foreign_key: true
        t.timestamps
      end
    end
  end