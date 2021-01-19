require 'rails_helper'

describe "competition index" do
  before :each do
    @comp1 = Competition.create!(name: "South Side Comp", location: "NYC", sport: "Basketball")
    @comp2 = Competition.create!(name: "North Side Comp", location: "Albany", sport: "Tennis")
    @comp3 = Competition.create!(name: "West Side Comp", location: "Buffalo", sport: "Hockey")
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
