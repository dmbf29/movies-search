class MoviesController < ApplicationController
  def index
    @movies = Movie.order(year: :desc, title: :asc)

    if params[:query].present?
      @movies = @movies.where("title ILIKE ?", "%#{params[:query]}%")
    end
    respond_to do |format|
      format.html
      format.json { render json: @movies }
      format.text { render partial: "movies/list", locals: { movies: @movies }, formats: [:html] }
    end
    # render 'index.html.erb'
  end
end
