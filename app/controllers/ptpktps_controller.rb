class PtpktpsController < ApplicationController
  before_action :set_ptpktp, only: [:show, :edit, :update, :destroy]

  # GET /ptpktps
  # GET /ptpktps.json
  def index
    @ptpktps = Ptpktp.order(date: :desc, msg_time: :desc)
  end

  # GET /ptpktps/1
  # GET /ptpktps/1.json
  def show
  end

  # GET /ptpktps/new
  def new
    @ptpktp = Ptpktp.new
  end

  # GET /ptpktps/1/edit
  def edit
  end

  # POST /ptpktps
  # POST /ptpktps.json
  def create
    @ptpktp = Ptpktp.new(ptpktp_params)

    respond_to do |format|
      if @ptpktp.save
        format.html { redirect_to ptpktps_path, notice: 'Запись успешно добавлена.' }
        format.json { render :show, status: :created, location: ptpktps_path }
      else
        format.html { render :new }
        format.json { render json: @ptpktp.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ptpktps/1
  # PATCH/PUT /ptpktps/1.json
  def update
    respond_to do |format|
      if @ptpktp.update(ptpktp_params)
        format.html { redirect_to ptpktps_path, notice: 'Запись успешно обновлена.' }
        format.json { render :show, status: :ok, location: ptpktps_path }
      else
        format.html { render :edit }
        format.json { render json: @ptpktp.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ptpktps/1
  # DELETE /ptpktps/1.json
  def destroy
    @ptpktp.destroy
    respond_to do |format|
      format.html { redirect_to ptpktps_url, notice: 'Запись успешно удалена.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ptpktp
      @ptpktp = Ptpktp.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ptpktp_params
      params[:ptpktp].permit(
                 :date,:msg_time,:address,:pch,:plan_cart,:numberptpktp,:hod,:karaul
      )
    end
end
