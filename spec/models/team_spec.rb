require 'rails_helper'

describe Team do
  describe "relationships" do
    it { should have_many :players }
    it { should have_many :competition_teams }
    it { should have_many(:competitions).through(:competition_teams) }
  end
  describe "instance methods" do
    it "list_players" do
      @team1 = Team.create!(hometown: "White Plains", nickname: "Almost NYC")
      @team2 = Team.create!(hometown: "Buffalo", nickname: "It's cold outside")
      @team3 = Team.create!(hometown: "Southhold", nickname: "North Forky")
      @team4 = Team.create!(hometown: "Shelter Island", nickname: "South Forky")

      @player1 = Player.create!(name: "Ray", age: 30, team_id: @team3.id)
      @player2 = Player.create!(name: "Kiersten", age: 35, team_id: @team3.id)
      @player3 = Player.create!(name: "Jackie", age: 25, team_id: @team4.id)
      @player4 = Player.create!(name: "Kristin", age: 35, team_id: @team4.id)
      @player5 = Player.create!(name: "Rachel", age: 25, team_id: @team1.id)

      expect(@team3.list_players).to eq([@player1, @player2])
    end
  end 
end
