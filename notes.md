Models: User, art_schedule, art_plan, art_project 

User: has many art plans, has many art projects through art plans, and has many art schedules through art projects

art_schedule: belongs to art project, belongs to art plan 

art_plan: belongs to user, has many art schedules, has many art projects, through art schedules 

art project: has many art schedules, has many art plans through art schedules 


byebug 
(byebug) artplan
#<ArtPlan id: 2, goal: "Write Gallery Description", description: "Medium", user_id: 1, created_at: "2020-09-13 19:57:23", updated_at: "2020-09-13 19:57:23">
(byebug) artplan.art_projects
  ArtProject Load (0.4ms)  SELECT "art_projects".* FROM "art_projects" INNER JOIN "art_schedules" ON "art_projects"."id" = "art_schedules"."art_project_id" WHERE "art_schedules"."art_plan_id" = ? ORDER BY "art_projects"."updated_at" DESC, "art_schedules"."updated_at" DESC LIMIT ?  [["art_plan_id", 2], ["LIMIT", 11]]
  ↳ app/views/art_plans/_artplan.html.erb:14
#<ArtProject::ActiveRecord_Associations_CollectionProxy:0x00007ffa83dfc3b8>
(byebug) artplan.art_projects.count
   (0.3ms)  SELECT COUNT(*) FROM "art_projects" INNER JOIN "art_schedules" ON "art_projects"."id" = "art_schedules"."art_project_id" WHERE "art_schedules"."art_plan_id" = ?  [["art_plan_id", 2]]
  ↳ (byebug):1
*** ActiveRecord::StatementInvalid Exception: SQLite3::SQLException: no such column: art_schedules.art_project_id

nil
(byebug) Artplan.all
*** NameError Exception: uninitialized constant #<Class:0x00007ffa83c253c8>::Artplan

nil
(byebug) User.all
  User Load (0.2ms)  SELECT "users".* FROM "users" LIMIT ?  [["LIMIT", 11]]
  ↳ app/views/art_plans/_artplan.html.erb:14
#<ActiveRecord::Relation [#<User id: 1, name: "dahlia", email: "dahliabloomstone@gmail.com", password_digest: [FILTERED], uid: nil, password_confirmation: nil, created_at: "2020-09-11 19:04:53", updated_at: "2020-09-11 19:04:53">]>
(byebug) ap = Artplan.create(goal: "paint once a day", description: "nice", user_id: 1)
*** NameError Exception: uninitialized constant #<Class:0x00007ffa83c253c8>::Artplan

nil
(byebug) ArtPlan.all
  ArtPlan Load (0.2ms)  SELECT "art_plans".* FROM "art_plans" ORDER BY "art_plans"."updated_at" DESC LIMIT ?  [["LIMIT", 11]]
  ↳ app/views/art_plans/_artplan.html.erb:14
#<ActiveRecord::Relation [#<ArtPlan id: 2, goal: "Write Gallery Description", description: "Medium", user_id: 1, created_at: "2020-09-13 19:57:23", updated_at: "2020-09-13 19:57:23">, #<ArtPlan id: 1, goal: "Write Gallery Description", description: "Medium", user_id: 1, created_at: "2020-09-13 19:55:26", updated_at: "2020-09-13 19:55:26">]>
(byebug) ap = ArtPlan.create(goal: "paint once a day", description: "nice", user_id: 1)
  CACHE User Load (0.0ms)  SELECT "users".* FROM "users" WHERE "users"."id" = ? LIMIT ?  [["id", 1], ["LIMIT", 1]]
  ↳ (byebug):1
   (0.1ms)  begin transaction
  ↳ (byebug):1
  ArtPlan Create (1.2ms)  INSERT INTO "art_plans" ("goal", "description", "user_id", "created_at", "updated_at") VALUES (?, ?, ?, ?, ?)  [["goal", "paint once a day"], ["description", "nice"], ["user_id", 1], ["created_at", "2020-09-15 16:32:27.120352"], ["updated_at", "2020-09-15 16:32:27.120352"]]
  ↳ (byebug):1
   (0.7ms)  commit transaction
  ↳ (byebug):1
#<ArtPlan id: 3, goal: "paint once a day", description: "nice", user_id: 1, created_at: "2020-09-15 16:32:27", updated_at: "2020-09-15 16:32:27">
(byebug) first = ArtPlan.first
  ArtPlan Load (0.2ms)  SELECT "art_plans".* FROM "art_plans" ORDER BY "art_plans"."updated_at" DESC LIMIT ?  [["LIMIT", 1]]
  ↳ (byebug):1
#<ArtPlan id: 3, goal: "paint once a day", description: "nice", user_id: 1, created_at: "2020-09-15 16:32:27", updated_at: "2020-09-15 16:32:27">
(byebug) first.art_projects
  ArtProject Load (0.4ms)  SELECT "art_projects".* FROM "art_projects" INNER JOIN "art_schedules" ON "art_projects"."id" = "art_schedules"."art_project_id" WHERE "art_schedules"."art_plan_id" = ? ORDER BY "art_projects"."updated_at" DESC, "art_schedules"."updated_at" DESC LIMIT ?  [["art_plan_id", 3], ["LIMIT", 11]]
  ↳ app/views/art_plans/_artplan.html.erb:14
#<ArtProject::ActiveRecord_Associations_CollectionProxy:0x00007ffab3b832f0>
(byebug) ArtProject.all
  ArtProject Load (1.0ms)  SELECT "art_projects".* FROM "art_projects" ORDER BY "art_projects"."updated_at" DESC LIMIT ?  [["LIMIT", 11]]
  ↳ app/views/art_plans/_artplan.html.erb:14
#<ActiveRecord::Relation []>
(byebug) 