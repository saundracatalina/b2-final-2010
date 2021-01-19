require 'rails_helper'

describe "a competition's show page" do
  before :each do
    @comp1 = Competition.create!(name: "South Side Comp", location: "NYC", sport: "Basketball")
    @comp2 = Competition.create!(name: "North Side Comp", location: "Albany", sport: "Tennis")
    @comp3 = Competition.create!(name: "West Side Comp", location: "Buffalo", sport: "Hockey")

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
  it "can see the name and hometown of all teams in this competition"
  it "can see the average age of all the players in the competition"
end
