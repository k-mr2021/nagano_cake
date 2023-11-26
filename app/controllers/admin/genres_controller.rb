class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @genre = Genre.all
    @genres = Genre.new
  end
  
  def create
    @genre = Genre.new(genre_params)
    @genre.save
    redirect_to admin_genres_path
  end
  
  
  private
  
  def genre_params
    params.require(:genre).permit(:name)
  end
  
end







