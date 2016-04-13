class EddscardsController < ApplicationController
  before_action :set_eddscard, only: [:show, :edit, :update, :destroy]

  # GET /eddscards
  # GET /eddscards.json
  def index
    @eddscards = Eddscard.order(date: :desc, msg_time: :desc).first(800)
  end

  # GET /eddscards/1
  # GET /eddscards/1.json
  def show
  end

  # GET /eddscards/new
  def new
    @eddscard = Eddscard.new
  end

  # GET /eddscards/1/edit
  def edit
  end

  # POST /eddscards
  # POST /eddscards.json
  def create
    @eddscard = Eddscard.new(eddscard_params)

    respond_to do |format|
      if @eddscard.save
        format.html { redirect_to eddscards_path, notice: 'Запись успешно добавлена.' }
        format.json { render :show, status: :created, location: eddscards_path }
      else
        format.html { render :new }
        format.json { render json: @eddscard.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /eddscards/1
  # PATCH/PUT /eddscards/1.json
  def update
    respond_to do |format|
      if @eddscard.update(eddscard_params)
        format.html { redirect_to eddscards_path, notice: 'Запись успешно обновлена.' }
        format.json { render :show, status: :ok, location: eddscards_path }
      else
        format.html { render :edit }
        format.json { render json: @eddscard.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /eddscards/1
  # DELETE /eddscards/1.json
  def destroy
    @eddscard.destroy
    respond_to do |format|
      format.html { redirect_to eddscards_url, notice: 'Запись успешно удалена.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_eddscard
      @eddscard = Eddscard.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def eddscard_params
      params[:eddscard].permit(:date, :msg_time, :address,:fio,:tel, :sluzhby, :description)
    end
end
