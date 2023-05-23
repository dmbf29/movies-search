class MoviesController < ApplicationController
  def index
    @movies = Movie.order(year: :desc, title: :asc)

    if params[:query].present?
      @movies = @movies.where("title ILIKE ?", "%#{params[:query]}%")
    end
    # we can controller how our controller actions respond
    # by default, it's just responding to HTML. but we want HTML AND text
    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.json { render json: @movies }
      format.text { render partial: "movies/list", locals: { movies: @movies }, formats: [:html] }
    end
  end
end
