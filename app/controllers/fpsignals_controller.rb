class FpsignalsController < ApplicationController
  before_action :set_fpsignal, only: [:show, :edit, :update, :destroy]

  # GET /fpsignals
  # GET /fpsignals.json
  def index
    @fpsignals = Fpsignal.order(date: :desc, msg_time: :desc)
  end

  # GET /fpsignals/1
  # GET /fpsignals/1.json
  def show
  end

  # GET /fpsignals/new
  def new
    @fpsignal = Fpsignal.new
  end

  # GET /fpsignals/1/edit
  def edit
  end

  # POST /fpsignals
  # POST /fpsignals.json
  def create
    @fpsignal = Fpsignal.new(fpsignal_params)

    respond_to do |format|
      if @fpsignal.save
        format.html { redirect_to fpsignals_path, notice: 'Запись успешно добавлена.' }
        format.json { render :show, status: :created, location: fpsignals_path }
      else
        format.html { render :new }
        format.json { render json: @fpsignal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fpsignals/1
  # PATCH/PUT /fpsignals/1.json
  def update
    respond_to do |format|
      if @fpsignal.update(fpsignal_params)
        format.html { redirect_to fpsignals_path, notice: 'Запись успешно обновлена.' }
        format.json { render :show, status: :ok, location: fpsignals_path }
      else
        format.html { render :edit }
        format.json { render json: @fpsignal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fpsignals/1
  # DELETE /fpsignals/1.json
  def destroy
    @fpsignal.destroy
    respond_to do |format|
      format.html { redirect_to fpsignals_url, notice: 'Запись успешно удалена.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fpsignal
      @fpsignal = Fpsignal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fpsignal_params
      params[:fpsignal].permit(:date, :msg_time, :type_signal, :technic, :description, :karaul)
    end
end
