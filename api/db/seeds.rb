# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create({name: 'Jonas', password: 'keins'})
User.create({name: 'Moritz', password: 'keins'})
User.create({name: 'Lukas', password: 'keins'})
User.create({name: 'Dummy User', password: 'keins'})

Group.create({name: 'Multimedia Projekt 2', admin: User.find(1)})
Group.create({name: 'Content Management Systeme', admin: User.find(2)})
Group.create({name: 'Statistik', admin: User.find(3)})
Group.create({name: 'Dummy Group', admin: User.find(4)})

Group.find(1).users << User.find(1)
Group.find(1).users << User.find(2)
Group.find(1).users << User.find(3)

Group.find(2).users << User.find(1)
Group.find(2).users << User.find(2)
Group.find(2).users << User.find(3)

Group.find(3).users << User.find(2)
Group.find(3).users << User.find(3)

Group.find(4).users << User.find(4)

Group.find(1).users.each do |user|
  user.tasks.create({name: 'Studienwoche Projekte fertigstellen.', description: 'Etwas in Javascript programmieren, muss hübsch aussehen :-)', due_date: '2018-02-02', group: Group.find(1)})
end

Group.find(3).users.each do |user|
  user.tasks.create({name: 'Für Klausur lernen.', description: 'Zahlen machen Spaß...', due_date: '2018-01-24', group: Group.find(3)})
end

Group.find(4).users.each do |user|
  user.tasks.create({name: 'Einkaufen', description: 'Äpfel, Zwiebeln, Essig, Käse', group: Group.find(4)})
end