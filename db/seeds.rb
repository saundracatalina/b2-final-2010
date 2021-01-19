# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@comp1 = Competition.create!(name: "South Side Comp", location: "NYC", sport: "Basketball")
@comp2 = Competition.create!(name: "North Side Comp", location: "Albany", sport: "Tennis")
@comp3 = Competition.create!(name: "West Side Comp", location: "Buffalo", sport: "Hockey")

@team1 = Team.create!(hometown: "White Plains", nickname: "Almost NYC")
@team2 = Team.create!(hometown: "Buffalo", nickname: "It's cold outside")
@team3 = Team.create!(hometown: "Southhold", nickname: "North Forky")
@team4 = Team.create!(hometown: "Shelter Island", nickname: "South Forky")

@comp1.teams << @team3
@comp1.teams << @team4
@comp2.teams << @team1
@comp2.teams << @team2

@player1 = Player.create!(name: "Ray", age: 20, team_id: @team3.id)
@player2 = Player.create!(name: "Kiersten", age: 30, team_id: @team3.id)
@player3 = Player.create!(name: "Jackie", age: 25, team_id: @team4.id)
@player4 = Player.create!(name: "Kristin", age: 35, team_id: @team4.id)

@player5 = Player.create!(name: "Rachel", age: 35, team_id: @team1.id)
