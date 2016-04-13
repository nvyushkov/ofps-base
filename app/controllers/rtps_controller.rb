class RtpsController < ApplicationController
  before_action :set_rtp, only: [:show, :edit, :update, :destroy]

  # GET /rtps
  # GET /rtps.json
  def index
    @rtps = Rtp.all
  end

  # GET /rtps/1
  # GET /rtps/1.json
  def show
  end

  # GET /rtps/new
  def new
    @rtp = Rtp.new
  end

  # GET /rtps/1/edit
  def edit
  end

  # POST /rtps
  # POST /rtps.json
  def create
    @rtp = Rtp.new(rtp_params)

    respond_to do |format|
      if @rtp.save
        format.html { redirect_to rtps_path, notice: 'РТП успешно добавлен' }
        format.json { render :show, status: :created, location: @rtp }
      else
        format.html { render :new }
        format.json { render json: @rtp.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rtps/1
  # PATCH/PUT /rtps/1.json
  def update
    respond_to do |format|
      if @rtp.update(rtp_params)
        format.html { redirect_to rtps_path, notice: 'РТП успешно обновлен' }
        format.json { render :show, status: :ok, location: @rtp }
      else
        format.html { render :edit }
        format.json { render json: @rtp.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rtps/1
  # DELETE /rtps/1.json
  def destroy
    @rtp.destroy
    respond_to do |format|
      format.html { redirect_to rtps_path, notice: 'РТП успешно удален' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rtp
      @rtp = Rtp.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rtp_params
      params[:rtp].permit(
          :name,:family_name,:otch_name,:dolzhnost
      )
    end
end
