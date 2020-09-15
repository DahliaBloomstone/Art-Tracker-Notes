# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#art plan:
ap = ArtPlan.create(goal: "paint once a day", description: "nice", user_id: 1)

#art schedule:
as = ArtSchedule.create(art_time: "three in the morning", art_type: "video", art_id: 1, art_plan_id: 1)


#art project:
at = ArtProject.create(medium: "video", datetime: "Monday", idea: "Election", artist_reference: "Condit", content: "Identity", price: 3, art_plan_id: 1)

   