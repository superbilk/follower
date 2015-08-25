class UsersController < ApplicationController
  before_action :authenticate_user!

  # GET /users
  # GET /users.json
  def index
    @user = current_user
    @my_timeline = current_user.twitter.home_timeline(count: 5)
  end
end
