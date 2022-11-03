class ResearchesController < ApplicationController
  before_action :set_research, only: %i[ show edit update destroy ]

  # GET /researches or /researches.json
  def index
    @researches = Research.all
  end

  # GET /researches/1 or /researches/1.json
  def show
  end

  # GET /researches/new
  def new
    @research = Research.new
  end

  # GET /researches/1/edit
  def edit
  end

  # POST /researches or /researches.json
  def create
    @research = Research.new(research_params)

    respond_to do |format|
      if @research.save
        format.html { redirect_to research_url(@research), notice: "Research was successfully created." }
        format.json { render :show, status: :created, location: @research }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @research.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /researches/1 or /researches/1.json
  def update
    respond_to do |format|
      if @research.update(research_params)
        format.html { redirect_to research_url(@research), notice: "Research was successfully updated." }
        format.json { render :show, status: :ok, location: @research }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @research.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /researches/1 or /researches/1.json
  def destroy
    @research.destroy

    respond_to do |format|
      format.html { redirect_to researches_url, notice: "Research was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_research
      @research = Research.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def research_params
      params.require(:research).permit(:user_id, :title, :number_of_auther, :year, :journal, :patent)
    end
end
