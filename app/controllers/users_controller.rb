class UsersController < ApplicationController
  before_action :authenticate_user!

  # GET /users
  # GET /users.json
  def index
    # @user = current_user
    # begin
    #   @my_timeline = current_user.twitter.home_timeline(count: 5)
    # rescue Twitter::Error::TooManyRequests => error
    #   @my_timeline = []
    # end
  end

  def dashboard
  end

end
