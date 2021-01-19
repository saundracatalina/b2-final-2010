require 'rails_helper'

describe "competition index" do
  before :each do
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
    @comp3.teams << @team2
    @comp3.teams << @team2

    @player1 = Player.create!(name: "Ray", age: 20, team_id: @team3.id)
    @player2 = Player.create!(name: "Kiersten", age: 30, team_id: @team3.id)
    @player3 = Player.create!(name: "Jackie", age: 25, team_id: @team4.id)
    @player4 = Player.create!(name: "Kristin", age: 35, team_id: @team4.id)

    @player5 = Player.create!(name: "Rachel", age: 35, team_id: @team1.id)
  end
  it "can see the names of all competitions" do
    visit competitions_path

    expect(page).to have_content(@comp1.name)
    expect(page).to have_content(@comp2.name)
    expect(page).to have_content(@comp3.name)
  end
  it "each competition name links to it's show page" do
    visit competitions_path

    expect(page).to have_link("#{@comp1.name}")
    expect(page).to have_link("#{@comp2.name}")
    expect(page).to have_link("#{@comp3.name}")

    click_link "#{@comp1.name}"

    expect(current_path).to eq(competition_path(@comp1))
  end
end
