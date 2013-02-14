class HomeController < ApplicationController

  before_filter :authenticate_user!, :only => [:dashboard]

  def index
    @users = []
  end

  def dashboard
    @users = User.all
  end
end
