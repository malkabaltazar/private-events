class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    if @user
      @events = @user.events
      @upcoming_events = @user.attended_events.upcoming_events
      @prev_events = @user.attended_events.previous_events
    else
      redirect_to root_url
    end
  end

  private

    def user_params
      params.require(:user).permit(:name)
    end
end
