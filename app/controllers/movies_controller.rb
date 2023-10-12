class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def new
  end

  def create
    movie = Movie.new({
    title: params[:title],
    description: params[:description]
    })

    movie.save
    redirect_to '/movies'
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    movie = Movie.find(params[:id])
    movie.update({
      title: params[:title],
      description: params[:description]
      })
    movie.save
    redirect_to "/movies/#{movie.id}"
  end

  def destroy
    Movie.destroy(params[:id])
    redirect_to '/movies'
  end

end
