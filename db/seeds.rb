# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

position_list = [["Internship","Internship"],["Administrator","Admin"]]
position_list.each do |name,abbr|
  Position.create(name: name, abbreviation: abbr)
end
project_list = [["Training Management System","TMS",Date.new(2014,7,14),Date.new(2014,8,1),1],["Members Management System","MMS",Date.new(2014,8,2),Date.new(2014,8,14),1],
["E-Learning System","ELS",Date.new(2014,7,14),Date.new(2014,8,14),2]]
project_list.each do |name,shortname,start_date,end_date,team_id|
  Project.create(name: name,shortname: shortname,start_date: start_date, end_date: end_date, team_id: team_id)  	
end
team_list = [["ICT_K56_Team1","Class ICT_K56's Team1"],["ICT_K56_Team2","Class ICT_K56's Team2"]]
team_list.each do |name,description|
  Team.create(name: name, description: description)
end
user_list = [["NguyenVanA","NguyenVanA@gmail.com",Date.new(1993,8,21),1,0,1,"123456","123456"],
["NguyenVanB","NguyenVanB@gmail.com",Date.new(1993,8,22),1,0,1,"123456","123456"],
["NguyenVanC","NguyenVanC@gmail.com",Date.new(1993,8,23),1,0,1,"123456","123456"],
["NguyenVanD","NguyenVanD@gmail.com",Date.new(1993,8,24),1,0,2,"123456","123456"],
["NguyenVanE","NguyenVanE@gmail.com",Date.new(1993,8,25),1,0,2,"123456","123456"]
]
user_list.each do |name,email,birthday,position_id,admin,team_id,password,password_confirmation|
  User.create(name: name, email: email, birthday: birthday, position_id: position_id, admin: admin, team_id: team_id,password: password, password_confirmation: password_confirmation)
end
admin_list = [["NguyenVanF","NguyenVanF@gmail.com",Date.new(1993,8,26),2,1,"123456","123456"]]
admin_list.each do |name,email,birthday,position_id,admin,password,password_confirmation|
  User.create(name: name, email: email, birthday: birthday, position_id: position_id, admin: admin,password: password, password_confirmation: password_confirmation)
end

user_skill_list = [[1,1,1,1],[1,2,1,1],[1,3,1,1],[2,2,1,1],[2,3,1,1],[2,4,1,1],[3,1,1,1],[3,5,1,1],[3,6,1,1],[4,2,1,1],[4,4,1,1],[4,5,1,1],[5,3,1,1],[5,4,1,1],[5,6,1,1]]
user_skill_list.each do |user_id,skill_id,level,usedyear|
  UserSkill.create(user_id: user_id, skill_id: skill_id,level: level, usedyear: usedyear)
end
user_project_list = [[1,1,1],[1,2,1],[2,1,0],[2,2,0],[3,1,0],[3,2,0],[4,3,1],[5,3,0]]
user_project_list.each do |user_id,project_id,leader|
  UserProject.create(user_id: user_id,project_id: project_id,leader: leader)
end
skill_list = [["Java",1],["C",2],["Ruby on Rails",3],["Git",4],["SQL",5],["PHP",6]]
skill_list.each do |description,id|
  Skill.create(description: description)
end