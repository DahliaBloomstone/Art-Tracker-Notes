class CreateArtPlans < ActiveRecord::Migration[5.2]
    def change
      create_table :art_plans do |t|
        t.string :goal
        t.string :description
        t.references :user, foreign_key: true
        t.timestamps
      end
    end
  end