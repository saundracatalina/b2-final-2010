class CompetitionTeamsController < ApplicationController
  def new
    @competition = Competition.find(params[:competition_id])
  end

  def create
    @team = Team.find_by(hometown: params[:hometown],
                         nickname: params[:nickname])
    @competition = Competition.find(params[:competition_id])
    CompetitionTeam.create!(team_id: @team.id, competition_id: @competition.id)
    redirect_to competition_path(@competition)
  end
end
