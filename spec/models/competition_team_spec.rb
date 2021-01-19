require 'rails_helper'

describe CompetitionTeam do
  describe "relationships" do
    it { should belong_to :team }
    it { should belong_to :competition }
  end
end
