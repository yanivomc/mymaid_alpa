module SessionsHelper

  def current_user_professional?(professional)
    @current_user_professional = professional

  end

  def sign_in(user)
    # cookies.permanent = it will expires in 20 years
    cookies.permanent[:remember_token] = user.remember_token
    self.current_user = user
  end

  def sign_out
    self.current_user = nil
    cookies.delete(:remember_token)
  end

  def signed_in?
    !current_user.nil?
  end

  def current_user=(user)
  @current_user = user

  end

  def current_user
    @current_user ||=User.find_by_remember_token(cookies[:remember_token])
  end

  def search_for=(users)
    #@user_find  = User.where("first_name like ?", "%yaniv%")
    #usersearch = User.find_by_email("yanivomc@gmail.com")
    @pro_search = pr

    #@user_find_all = User.where("first_name like ?", "%#dar%").to_sql
    #@user_results = User.where("first_name LIKE ?", "%yaniv%")

    # @search = User.new_search(params[:email])
    #       @search.condition.field_starts_with = "prefix"
    #      @search_for = @search.all

  end

  #///////// Session control for Professionals /////

  def sign_in_professional(professional)
    # cookies.permanent = it will expires in 20 years
    cookies.permanent[:remember_token_professional] = professional.remember_token_professional
    self.current_user_professional = professional
  end

  def sign_out_professional
    self.current_user_professional = nil
    cookies.delete(:remember_token_professional)
  end

  def signed_in_professional?
    !current_user_professional.nil?
  end





  def current_user_professional=(professional)
    @current_user_professional = professional

  end

  def current_user_professional
    @current_user_professional ||= Professional.find_by_remember_token_professional(cookies[:remember_token_professional])
  end

end

