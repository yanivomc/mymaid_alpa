class ProfessionalController < ApplicationController
  # Check if Signed in users are try to reach the :new and :create
  before_filter :check_if_signed_in, only: [:new, :create, :search_results ]
  before_filter :block_show, only: :show


  def index


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




  private
  def check_if_signed_in
    redirect_to (root_path) unless !signed_in_professional?

  end

  def block_show
    redirect_to (root_path) unless signed_in_professional?
  end


end
