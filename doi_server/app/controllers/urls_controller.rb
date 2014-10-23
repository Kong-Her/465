class UrlsController < ApplicationController
  before_action :set_url, only: [:edit, :update, :destroy]

  def index
    @doi = Doi.find params[:doi_id]
    @urls = @doi.urls
  end

  def new
    @doi = Doi.find params[:doi_id]
    @url = @doi.urls.new
  end

  def edit
  end

  def create
    @doi = Doi.find params[:doi_id]
    @url = @doi.urls.new(url_params)

    if @url.save
      redirect_to doi_urls_url(@doi) , notice: 'URL was successfully created.'
    else
      render :new
    end
  end

  def update
    if @url.update(url_params)
      redirect_to doi_urls_url(@url.doi), notice: 'URL was successfully updated.'
    else
      render :edit
    end
  end

  def show
    @url = Doi.find params[:doi_id]
  end

  def destroy
    @url.destroy
    redirect_to doi_urls_url(@url.doi) , notice: 'URL was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_url
      @url = Url.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def url_params
      params.require(:url).permit(:url)
    end
end

