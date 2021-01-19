require 'rails_helper'

describe Player do
  describe "relationships" do
    it { should belong_to :team }
  end
end
