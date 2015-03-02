# UsersController manages user profile
class UsersController < ApplicationController
  # GET /@:username
  def show
    @user = User.find_by_username(params[:username])
  end
end
