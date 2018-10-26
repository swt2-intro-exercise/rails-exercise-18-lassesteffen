class AuthorsController < ApplicationController
  def show
    @authors = Author.find(params[:id])
  end

  def new
  end

  def create
    @author = Author.new(author_params)
    @author.save
    # redirect_to @author
  end

  private

  def author_params
    params.require(:authors).permit(:first_name, :last_name, :homepage)
  end
end