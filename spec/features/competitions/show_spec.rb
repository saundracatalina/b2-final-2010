require 'rails_helper'

describe "a competition's show page" do
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

    @player1 = Player.create!(name: "Ray", age: 20, team_id: @team3.id)
    @player2 = Player.create!(name: "Kiersten", age: 30, team_id: @team3.id)
    @player3 = Player.create!(name: "Jackie", age: 25, team_id: @team4.id)
    @player4 = Player.create!(name: "Kristin", age: 35, team_id: @team4.id)

    @player5 = Player.create!(name: "Rachel", age: 35, team_id: @team1.id)
  end
  it "can see the competition's name, location, and sport" do
    visit competition_path(@comp1)

    expect(page).to have_content(@comp1.name)
    expect(page).to have_content("Location: #{@comp1.location}")
    expect(page).to have_content("Sport: #{@comp1.sport}")

    expect(page).to_not have_content(@comp2.name)
    expect(page).to_not have_content(@comp2.location)
    expect(page).to_not have_content(@comp3.sport)
  end
  it "can see the name and hometown of all teams in this competition" do
    visit competition_path(@comp1)

    within("#team-#{@team3.id}") do
      expect(page).to have_content(@team3.hometown)
      expect(page).to have_content(@team3.nickname)
    end
    within("#team-#{@team4.id}") do
      expect(page).to have_content(@team4.hometown)
      expect(page).to have_content(@team4.nickname)
    end
    expect(page).to_not have_content(@team1.hometown)
    expect(page).to_not have_content(@team1.nickname)
    expect(page).to_not have_content(@team2.hometown)
    expect(page).to_not have_content(@team2.nickname)
  end
  it "can see the average age of all the players in the competition" do
    visit competition_path(@comp1)

    expect(page).to have_content("Average age of players in Competition: #{@comp1.ave_players_age}")
  end
  it "can click link to register a new team,redirects back to show and can see team added" do
    visit competition_path(@comp1)

    expect(page).to_not have_content(@team2.hometown)
    expect(page).to_not have_content(@team2.nickname)

    click_link "Register New Team"

    expect(current_path).to eq(new_competition_competition_team_path(@comp1))

    fill_in "hometown", with: @team2.hometown
    fill_in "nickname", with: @team2.nickname

    click_on "Add Team"

    expect(current_path).to eq(competition_path(@comp1))
    expect(page).to have_content(@team2.hometown)
    expect(page).to have_content(@team2.nickname)
  end
end
