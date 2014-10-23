class DoisController < ApplicationController
  before_action :set_doi, only: [:show, :edit, :update, :destroy]

  def index
    @dois = Doi.all
  end

  def show
    @doi = rand(2**50).to_s(32)
  end

  def new
    @doi = Doi.new
  end

  def edit
  end

  def create
    @doi = Doi.new(doi_params)

    if @doi.save
      redirect_to @doi, notice: 'DOI was successfully created.'
    else
      render :new
    end
  end

  def update
    if @doi.update(doi_params)
      redirect_to @doi, notice: 'DOI was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @doi.destroy
    redirect_to dois_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_doi
      @doi = Doi.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def doi_params
      params.require(:doi).permit(:doi)
    end
end
