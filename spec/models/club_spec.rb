require 'spec_helper'

describe Club do
  before do
    @club = Club.new name: "My Toastmaster Club", 
                     netname: "my-toastmaster-club"
  end

  subject { @club }

  it { should respond_to(:name) }
  it { should respond_to(:netname) }
  it { should be_valid }

  describe "when name is not present" do
    before { @club.name = " " }
    it { should_not be_valid }
  end

  describe "when name is already taken" do
    before do
      club_with_same_name = @club.dup
      club_with_same_name.netname = "not-the-same-netname"
      club_with_same_name.save
    end

    it { should_not be_valid }
  end

  describe "when netname is not present" do
    before { @club.netname = " " }
    it { should_not be_valid }
  end

  describe "when name is too long" do
    before { @club.name = "a" * 65 }
    it { should_not be_valid }
  end

  describe "when netname is too long" do
    before { @club.netname = "a" * 65 }
    it { should_not be_valid }
  end

  describe "when netname format is invalid" do
    # Only allow a-z, A-Z, 0-9, '-', starting with a letter or number
    it "should be invalid" do
      netnames = %w[12_12 a,b a/b a.b t+g -ab]
      netnames.each do |invalid_netname|
        @club.netname = invalid_netname
        @club.should_not be_valid
      end
    end
  end

  describe "when netname format is valid" do
    # Only allow a-z, A-Z, 0-9, '-', starting with a letter or number
    it "should be invalid" do
      netnames = %w[blah-blah humble-toastmasters 12-Men-And-A-Baby HumbleToastmasters]
      netnames.each do |valid_netname|
        @club.netname = valid_netname
        @club.should be_valid
      end
    end
  end
  
  describe "when netname is already taken" do
    before do
      club_with_same_netname = @club.dup
      club_with_same_netname.name = "A very different name"
      club_with_same_netname.save
    end

    it { should_not be_valid }
  end

  describe "when netname the same except case is taken" do
    before do
      @club.netname.downcase!
      club_with_same_netname = @club.dup
      club_with_same_netname.netname.upcase!
      club_with_same_netname.save
    end
    it { should_not be_valid }
  end

end
