require 'spec_helper'

describe "Club pages" do

  subject { page }

  describe "club home page" do
    let(:club) { FactoryGirl.create(:club) }

    # Code to make a user variable
    before { visit club_path(club.netname) }

    it { should have_heading(club.name) }
    it { should have_title(full_title(club.name)) }
  end
end