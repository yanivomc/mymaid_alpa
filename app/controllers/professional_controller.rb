class ProfessionalController < ApplicationController
  # Check if Signed in users are try to reach the :new and :create
  before_filter :check_if_signed_in, only: [:new, :create, :search_results, :hired_by ]
  before_filter :block_show, only: :show


  def index


  end

  def hired_by
    @professional = Professional.find(params[:id])
    @professionals = @professional.hired_customers
    render 'hired_by'

  end

  def new

    @professional = Professional.new


  end

  def show
    @professional = Professional.find(params[:id])
     #@professional = Professional.find(params[:id])

  end

  def delete

  end


  def create
    @professional = Professional.new(params[:professional])

    if @professional.save
      flash[:success] = "Welcome to your new home!"
      redirect_to @professional
    else
      render 'static_pages/home'
    end


  end


  # /////////////    Follow / following
  def following
    @title = "Following"
    @professional = professional.find(params[:id])
    @professionals = @professional.followed_professionals.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end




# //////// Private functions

  private
  def check_if_signed_in
    redirect_to (root_path) unless !signed_in_professional?

  end

  def block_show
    redirect_to (root_path) unless signed_in_professional?
  end


end
