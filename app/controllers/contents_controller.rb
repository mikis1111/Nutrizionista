class ContentsController < ApplicationController
  before_action :set_content, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :authorize_admin!

  # GET /contents or /contents.json
  def index
    @contents = Content.all
  end

  # GET /contents/1 or /contents/1.json
  def show
    @content = Content.find(params[:id])
  end

  # GET /contents/new
  def new
    @content = Content.new
  end

  # GET /contents/1/edit
  def edit
  end

  # POST /contents or /contents.json
  def create
    @content = current_user.contents.build(content_params)
  
    if @content.save
      redirect_to @content, notice: "Contenuto creato con successo"
    else
      render :new
    end
  end
  
  

  # PATCH/PUT /contents/1 or /contents/1.json
  def update
    respond_to do |format|
      if @content.update(content_params)
        format.html { redirect_to @content, notice: "Content was successfully updated." }
        
      else
        format.html { render :edit, status: :unprocessable_entity }
        
      end
    end
  end

  # DELETE /contents/1 or /contents/1.json
  def destroy
    @content.destroy!

    respond_to do |format|
      format.html { redirect_to contents_path, status: :see_other, notice: "Content was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_content
      @content = Content.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def content_params
      params.require(:content).permit(:titolo, :descrizione, :price)
    end

    def authorize_admin!
      unless current_user&.admin?
        redirect_to root_path, alert: "Non sei autorizzato ad accedere a questa sezione."
      end
    end
end
