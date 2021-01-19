require 'rails_helper'

describe Player do
  describe "relationships" do
    it { should belong_to :team }
  end
  describe "class methods" do
    it "average player age" do
      @team1 = Team.create!(hometown: "White Plains", nickname: "Almost NYC")
      @team2 = Team.create!(hometown: "Buffalo", nickname: "It's cold outside")
      @team3 = Team.create!(hometown: "Southhold", nickname: "North Forky")
      @team4 = Team.create!(hometown: "Shelter Island", nickname: "South Forky")

      @player1 = Player.create!(name: "Ray", age: 30, team_id: @team3.id)
      @player2 = Player.create!(name: "Kiersten", age: 35, team_id: @team3.id)
      @player3 = Player.create!(name: "Jackie", age: 25, team_id: @team4.id)
      @player4 = Player.create!(name: "Kristin", age: 35, team_id: @team4.id)
      @player5 = Player.create!(name: "Rachel", age: 25, team_id: @team1.id)

      expect(Player.average_age).to eq(30)
    end
  end
end
