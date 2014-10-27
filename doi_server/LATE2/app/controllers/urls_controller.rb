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

  # GET /urls/1/edit
  def edit

  end

  def create
    @doi = Doi.find params[:doi_id]
    @url = @doi.urls.new(url_params)

    if @url.save
      redirect_to doi_url(@doi) , notice: 'Url was successfully created.'
    else
      render :new
    end
  end

  def update
    if @url.update(url_params)
      redirect_to doi_url(@url.doi), notice: 'Url was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /urls/1
  def destroy
    @url.destroy
    redirect_to doi_url(@url.doi) , notice: 'Url was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_url
      @url = Url.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def url_params
      params.require(:url).permit(:doi, :url)
    end
end

