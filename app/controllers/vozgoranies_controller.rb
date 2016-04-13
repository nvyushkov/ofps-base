class VozgoraniesController < ApplicationController
  before_action :set_vozgorany, only: [:show, :edit, :update, :destroy]

  # GET /vozgoranies
  # GET /vozgoranies.json
  def index
    @vozgoranies = Vozgoranie.order(date: :desc, msg_time: :desc)
  end

  # GET /vozgoranies/1
  # GET /vozgoranies/1.json
  def show
  end

  # GET /vozgoranies/new
  def new
    @vozgorany = Vozgoranie.new
  end

  # GET /vozgoranies/1/edit
  def edit
  end

  # POST /vozgoranies
  # POST /vozgoranies.json
  def create
    @vozgorany = Vozgoranie.new(vozgorany_params)

    respond_to do |format|
      if @vozgorany.save
        format.html { redirect_to vozgoranies_path, notice: 'Запись успешно добавлена.' }
        format.json { render :show, status: :created, location: vozgoranies_path }
      else
        format.html { render :new }
        format.json { render json: @vozgorany.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vozgoranies/1
  # PATCH/PUT /vozgoranies/1.json
  def update
    respond_to do |format|
      if @vozgorany.update(vozgorany_params)
        format.html { redirect_to vozgoranies_path, notice: 'Запись успешно обновлена.' }
        format.json { render :show, status: :ok, location: vozgoranies_path }
      else
        format.html { render :edit }
        format.json { render json: @vozgorany.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vozgoranies/1
  # DELETE /vozgoranies/1.json
  def destroy
    @vozgorany.destroy
    respond_to do |format|
      format.html { redirect_to vozgoranies_url, notice: 'Запись успешно удалена.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vozgorany
      @vozgorany = Vozgoranie.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vozgorany_params
      params[:vozgoranie].permit(
          :date, :address, :object, :chto_sgorelo, :usherb,
          :spasenorub, :pogibshie, :postradavshie, :spasenolud,
          :ploshad, :stvol_a, :stvol_b, :stvol_aps, :stvol_gps,
          :gdzs, :gdzs_time, :msg_time, :pribytie_time,
          :pervystvol_time, :local_time, :licvidation1_time, :licvidation2_time,
          :comeback_time, :technic, :rtp, :karaul
      )
    end
end
