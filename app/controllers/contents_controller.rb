# app/controllers/contents_controller.rb
class ContentsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :authorize_admin!
  before_action :set_content, only: %i[show edit update destroy]

  # GET /contents
  def index
    @contents = Content.all
  end

  # GET /contents/1
  def show
    # @content è già impostato da set_content
  end

  # GET /contents/new
  def new
    @content = Content.new
  end

  # GET /contents/1/edit
  def edit
    # @content è già impostato da set_content
  end

  # POST /contents
  def create
    @content = Content.new(content_params)
    @content.user = current_user     # assegna l’utente al momento della creazione

    if @content.save
      redirect_to @content, notice: "Contenuto creato con successo."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /contents/1
  def update
    @content.user = current_user     # ri-assegna l’utente per far passare la validazione

    if @content.update(content_params)
      redirect_to @content, notice: "Contenuto aggiornato con successo."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /contents/1
  def destroy
    @content.destroy!
    redirect_to contents_path, notice: "Contenuto eliminato."
  end

  private

  # Carica @content da usare in show, edit, update, destroy
  def set_content
    @content = Content.find(params[:id])
  end

  # Permette solo questi parametri (non includiamo :user_id qui)
  def content_params
    params.require(:content).permit(:titolo, :descrizione, :price, :cover, :allegato)
  end

  # Solo admin possono accedere a new/edit/create/update/destroy
  def authorize_admin!
    unless current_user&.admin?
      redirect_to root_path, alert: "Non sei autorizzato ad accedere a questa sezione."
    end
  end
end
