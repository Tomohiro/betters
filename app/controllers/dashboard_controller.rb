# DashboardController represents the user's dashboard
class DashboardController < ApplicationController
  before_action :authenticate_user!
end
