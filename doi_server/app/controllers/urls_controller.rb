class UrlsController < ApplicationController
  before_action :set_url, only: [:edit, :update, :destroy]

  # GET /professors/:professor_id/ratings
  def index
    # index is now all the ratings for a single professor (not all the ratings)
    # the URL will contain the id of the current professor (:professor_id)
    # use the :professor_id parameter to find all the ratings
    @doi = Doi.find params[:doi_id]
    # the has_many function called in app/models/professor.rb created the 
    # function "ratings" which will return an array of all the ratings 
    # with the professor foreign key matching @professor
    @urls = @doi.urls
  end

  # GET professors/:professor_id/ratings/new
  # Create a new rating in the context of a Professor object
  # that way the Rating's foreign key (professor_id) will be
  # initialized correctly.
  def new
    # since our the rating new path contains the professor's id
    # we can use params[:professor_id] to get that id
    @doi = Doi.find params[:doi_id]

    # This is similar to Rating.new, BUT it creates the new rating
    # in the context of a Professor object and sets the foreign key
    @url = @doi.urls.new
  end

  # GET /ratings/1/edit
  def edit
    # edit routes are not nested (we already know our professor's foreign_key)
  end

  # POST professors:/:professor_id/ratings
  # we need the professor's key in the URL to make sure that someone 
  # isn't trying to hack the id of the new rating's professor
  # rails ensures that the URL has not be tampered with
  def create
    @doi = Doi.find params[:doi_id]
    @url = @doi.urls.new(url_params)

    if @url.save
      redirect_to doi_url(@doi) , notice: 'URL was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /ratings/1
  # updates don't have to be nested because the professor foreign key is already set
  # and cannot be changed by edit (note that professor_id is not permitted in rating_params())
  def update
    if @rating.update(rating_params)
      redirect_to doi_url(@url.doi), notice: 'Url was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /ratings/1
  def destroy
    @url.destroy
    redirect_to doi_url(@url.doi) , notice: 'URL was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_url
      @url = Url.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def url_params
      params.require(:url).permit(:name, :description, :url)
    end
end
