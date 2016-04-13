class FiresController < ApplicationController
  before_action :set_fire, only: [:show, :edit, :update, :destroy]

  # GET /fires
  # GET /fires.json
  def index
    @fires = Fire.order(date: :desc, msg_time: :desc)
  end

  # GET /fires/1
  # GET /fires/1.json
  def show
    @ipv = Ipv.where( " fire_id = ?", params[:fire_id]).last
  end

  # GET /fires/new
  def new
    @fire = Fire.new
    @rtps = Rtp.all
  end

  # GET /fires/1/edit
  def edit
    @rtps = Rtp.all
  end

  # POST /fires
  # POST /fires.json
  def create
    @fire = Fire.new(fire_params)

    respond_to do |format|
      if @fire.save
        format.html { redirect_to new_ipv_path(:fire_id => @fire.id), notice: 'Запись успешно добавлена.' }
        format.json { render :show, status: :created, location: fires_path }
      else
        format.html { render :new }
        format.json { render json: @fire.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fires/1
  # PATCH/PUT /fires/1.json
  def update
    respond_to do |format|
      if @fire.update(fire_params)
        format.html { redirect_to fires_path, notice: 'Запись успешно обновлена.' }
        format.json { render :show, status: :ok, location: fires_path }
      else
        format.html { render :edit }
        format.json { render json: @fire.errors, status: :unprocessable_entity }
      end
    end
  end
  # DELETE /fires/1
  # DELETE /fires/1.json
  def destroy
    @ipv = Ipv.where( " fire_id = ?", params[:fire_id]).last
    @ipv.destroy
    @fire.destroy
    respond_to do |format|
      format.html { redirect_to fires_url, notice: 'Запись успешно удалена.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fire
      @fire = Fire.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fire_params
      params[:fire].permit(
          :date, :address, :object, :chto_sgorelo, :usherb,
          :spasenorub, :pogibshie, :postradavshie, :spasenolud,
          :ploshad, :stvol_a, :stvol_b, :stvol_aps, :stvol_gps,
          :gdzs, :gdzs_time, :msg_time, :pribytie_time,
          :pervystvol_time, :local_time, :licvidation1_time, :licvidation2_time,
          :comeback_time, :technic, :rtp, :karaul
      )
    end
end
