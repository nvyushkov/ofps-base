class ProchiesController < ApplicationController
  before_action :set_prochy, only: [:show, :edit, :update, :destroy]

  # GET /prochies
  # GET /prochies.json
  def index
    @prochies = Prochie.order(date: :desc, msg_time: :desc)
  end

  # GET /prochies/1
  # GET /prochies/1.json
  def show
  end

  # GET /prochies/new
  def new
    @prochy = Prochie.new
  end

  # GET /prochies/1/edit
  def edit
  end

  # POST /prochies
  # POST /prochies.json
  def create
    @prochy = Prochie.new(prochy_params)

    respond_to do |format|
      if @prochy.save
        format.html { redirect_to prochies_path, notice: 'Запись успешно создана.' }
        format.json { render :show, status: :created, location: prochies_path }
      else
        format.html { render :new }
        format.json { render json: @prochy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /prochies/1
  # PATCH/PUT /prochies/1.json
  def update
    respond_to do |format|
      if @prochy.update(prochy_params)
        format.html { redirect_to prochies_path, notice: 'Запись успешно обновлена.' }
        format.json { render :show, status: :ok, location: prochies_path }
      else
        format.html { render :edit }
        format.json { render json: @prochy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prochies/1
  # DELETE /prochies/1.json
  def destroy
    @prochy.destroy
    respond_to do |format|
      format.html { redirect_to prochies_url, notice: 'Запись успешно удалена.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prochy
      @prochy = Prochie.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def prochy_params
      params[:prochie].permit(:date,:msg_time,:address,:type_viezd,:sluzhby,:description,:karaul)
    end
end
