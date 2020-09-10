Models: User, art_schedule, art_plan, art_project 

User: has many art plans, has many art projects through art plans, and has many art schedules through art projects

art_schedule: belongs to art project, belongs to art plan 

art_plan: belongs to user, has many art schedules, has many art projects, through art schedules 

art project: has many art schedules, has many art plans through art schedules 