class UsersController < ApplicationController
  # Check if Signed in users are try to reach the :new and :create
  before_filter :check_if_signed_in, only: [:new, :create]
  before_filter :block_show, only: :show



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
      sign_in(@user)
      #hadnle a successful save
      flash[:success] =  "Welcome to MyMaid!"
      redirect_to @user
    else
      #Handle a failed save
      render 'new'
    end

  end

private
  def check_if_signed_in
    redirect_to (root_path) unless !signed_in?

  end

  def block_show
    redirect_to (root_path) unless signed_in?
  end

end

