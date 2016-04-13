class DtpsController < ApplicationController
  before_action :set_dtp, only: [:show, :edit, :update, :destroy]

  # GET /dtps
  # GET /dtps.json
  def index
    @dtps = Dtp.order(date: :desc, msg_time: :desc)
  end

  # GET /dtps/1
  # GET /dtps/1.json
  def show
  end

  # GET /dtps/new
  def new
    @dtp = Dtp.new
  end

  # GET /dtps/1/edit
  def edit
  end

  # POST /dtps
  # POST /dtps.json
  def create
    @dtp = Dtp.new(dtp_params)

    respond_to do |format|
      if @dtp.save
        format.html { redirect_to dtps_path, notice: 'Заись успешно добавлена.' }
        format.json { render :show, status: :created, location: dtps_path }
      else
        format.html { render :new }
        format.json { render json: @dtp.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dtps/1
  # PATCH/PUT /dtps/1.json
  def update
    respond_to do |format|
      if @dtp.update(dtp_params)
        format.html { redirect_to dtps_path, notice: 'Запись успешно обновлена' }
        format.json { render :show, status: :ok, location: dtps_path }
      else
        format.html { render :edit }
        format.json { render json: @dtp.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dtps/1
  # DELETE /dtps/1.json
  def destroy
    @dtp.destroy
    respond_to do |format|
      format.html { redirect_to dtps_url, notice: 'Запиь успешно удалена.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dtp
      @dtp = Dtp.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dtp_params
      params[:dtp].permit(
          :date, :address,:msg_time, :pch, :opisanie, :pogiblo, :postradalo,
          :asr_opisanie, :technic_pch, :karaul, :deblockers, :saved_peoples)
    end
end
