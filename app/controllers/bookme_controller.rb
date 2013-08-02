class BookmeController < ApplicationController
  def index
    @bookme = Bookme.find.all

  end


end
