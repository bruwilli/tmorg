require 'spec_helper'

describe Club do
  before { @club = Club.new(name: "My Toastmaster Club")}

  subject { @club }

  it { should respond_to(:name) }
  it { should be_valid }

  describe "when name is not present" do
    before { @club.name = " " }
    it { should_not be_valid }
  end

end
