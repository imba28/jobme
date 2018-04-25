class MatchingController < ApplicationController
  #skip_before_action :verify_authenticity_token
  
  # tinder match logik :-)
  # TODO
  def match
    @matches = Job.all  
  end
end
