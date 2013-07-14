class UsersController < ApplicationController
  def new
  @user = User.new
  end

  def show
  @user = User.find(params[:id])

  end

  def delete

  end

  def create
    @user = User.new(params[:user])
    # Handle if save was successful or if it failed
    if @user.save
      #hadnle a successful save
      flash[:success] = @user.first_name "Welcome to MyMaid!"
      redirect_to @user
    else
      #Handle a failed save
      render 'new'
    end

  end


end
