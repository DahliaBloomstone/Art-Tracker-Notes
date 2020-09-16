# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ArtPlan.destroy_all
ArtSchedule.destroy_all
ArtProject.destroy_all
User.destroy_all

#art plan:
ap = ArtPlan.create(goal: "paint once a day", description: "nice", user_id: 1)
ap1 = ArtPlan.create(goal: "make a video", description: "cool", user_id: 2)

#art schedule:
as = ArtSchedule.create(art_time: "three in the morning", art_type: "video", art_project_id: 1, art_plan_id: 1)
as1 = ArtSchedule.create(art_time: "four in the morning", art_type: "sculpture", art_project_id: 2, art_plan_id: 2)

#art project:
at = ArtProject.create(medium: "video", day: Date.today, idea: "Election", artist_reference: "Condit", content: "Identity", price: 3)
at1 = ArtProject.create(medium: "drawing", day: Date.today, idea: "Beauty", artist_reference: "Oursler", content: "Politics", price: 500)

#Users: 
u1 = User.create(name: "Bobby", email: "bobby@gmail.com", password_confirmation: "password")
u2 = User.create(name: "Bobbi", email: "bobbi@gmail.com", password_confirmation: "password")

