class ClubsController < ApplicationController
  def show
    @club = Club.find_by_netname(params[:id])
  end
end
