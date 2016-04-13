class ZanyatiaController < ApplicationController
  before_action :set_zanyatium, only: [:show, :edit, :update, :destroy]

  # GET /zanyatia
  # GET /zanyatia.json
  def index
    @zanyatia = Zanyatium.order(date: :desc, msg_time: :desc)
  end

  # GET /zanyatia/1
  # GET /zanyatia/1.json
  def show
  end

  # GET /zanyatia/new
  def new
    @zanyatium = Zanyatium.new
  end

  # GET /zanyatia/1/edit
  def edit
  end

  # POST /zanyatia
  # POST /zanyatia.json
  def create
    @zanyatium = Zanyatium.new(zanyatium_params)

    respond_to do |format|
      if @zanyatium.save
        format.html { redirect_to zanyatia_path, notice: 'Запись успешно добавлена.' }
        format.json { render :show, status: :created, location: zanyatia_path }
      else
        format.html { render :new }
        format.json { render json: @zanyatium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /zanyatia/1
  # PATCH/PUT /zanyatia/1.json
  def update
    respond_to do |format|
      if @zanyatium.update(zanyatium_params)
        format.html { redirect_to zanyatia_path, notice: 'Запись успешно обновлена' }
        format.json { render :show, status: :ok, location: zanyatia_path }
      else
        format.html { render :edit }
        format.json { render json: @zanyatium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /zanyatia/1
  # DELETE /zanyatia/1.json
  def destroy
    @zanyatium.destroy
    respond_to do |format|
      format.html { redirect_to zanyatia_url, notice: 'Запись успешно удалена.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_zanyatium
      @zanyatium = Zanyatium.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def zanyatium_params
      params[:zanyatium].permit(
          :date, :address, :msg_time, :pch,
          :rukovoditel, :zanyatiya, :hod, :karaul
      )
    end
end
