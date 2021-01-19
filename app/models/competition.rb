class Competition < ApplicationRecord
  has_many :competition_teams
  has_many :teams, through: :competition_teams

  def ave_players_age
    x = teams.joins(:players).pluck(:age)
    y = (x.sum/x.count)
    y
  end
end
