class SearchController < ApplicationController
  def results

    if params[:session][:source] == "professional"
    @search_results = User.where("first_name LIKE ?", "%#{params[:session][:name]}%")
    else

    @search_results = Professional.where("first_name LIKE ?", "%#{params[:session][:name]}%")

    end

    #@user_find_all = User.where("first_name like ?", "%#dar%").to_sql
    #@user_results = User.where("first_name LIKE ?", "%yaniv%")

    # @search = User.new_search(params[:email])
    #       @search.condition.field_starts_with = "prefix"
    #      @search_for = @search.all
  end

  def index

  end

  def show
    render 'new'
  end
  def search_results


  end
end
