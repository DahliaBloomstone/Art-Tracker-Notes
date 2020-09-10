class CreateArtProjects < ActiveRecord::Migration[5.2]
    def change
      create_table :art_projects do |t|
        t.string :medium
        t.datetime :day
        t.string :idea 
        t.string :artist_reference 
        t.string :content
        t.integer :price 
        t.references :art_plan, foreign_key: true
        t.timestamps
      end
    end
  end