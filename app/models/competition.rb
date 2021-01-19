class Competition < ApplicationRecord
  has_many :competition_teams
  has_many :teams, through: :competition_teams
  has_many :players, through: :teams

  def ave_players_age
    players.average(:age).to_f.round(2)
  end
end
