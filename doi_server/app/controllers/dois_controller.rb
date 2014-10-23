class DoisController < ApplicationController
  before_action :set_doi, only: [:show, :edit, :update, :destroy]

  # GET /professors
  def index
    @dois= Doi.all
  end

  # GET /professors/1
  def show
  end

  # GET /professors/new
  def new
    @doi = Doi.new
  end

  # GET /professors/1/edit
  def edit
  end

  # POST /professors
  def create
    @doi = Doi.new(doi_params)

    if @doi.save
      redirect_to @doi, notice: 'DOI was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /professors/1
  def update
    if @doi.update(doi_params)
      redirect_to @doi, notice: 'DOI was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /professors/1
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
