class EddsProchiesController < ApplicationController
  before_action :set_edds_prochy, only: [:show, :edit, :update, :destroy]

  # GET /edds_prochies
  # GET /edds_prochies.json
  def index
    @edds_prochies = EddsProchie.all
  end

  # GET /edds_prochies/1
  # GET /edds_prochies/1.json
  def show
  end

  # GET /edds_prochies/new
  def new
    @edds_prochy = EddsProchie.new
  end

  # GET /edds_prochies/1/edit
  def edit
  end

  # POST /edds_prochies
  # POST /edds_prochies.json
  def create
    @edds_prochy = EddsProchie.new(edds_prochy_params)

    respond_to do |format|
      if @edds_prochy.save
        format.html { redirect_to edds_prochies_url, notice: 'Запись успешно создана.' }
        format.json { render :show, status: :created, location: @edds_prochy }
      else
        format.html { render :new }
        format.json { render json: @edds_prochy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /edds_prochies/1
  # PATCH/PUT /edds_prochies/1.json
  def update
    respond_to do |format|
      if @edds_prochy.update(edds_prochy_params)
        format.html { redirect_to edds_prochies_url, notice: 'Запись успешно обновлена.' }
        format.json { render :show, status: :ok, location: @edds_prochy }
      else
        format.html { render :edit }
        format.json { render json: @edds_prochy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /edds_prochies/1
  # DELETE /edds_prochies/1.json
  def destroy
    @edds_prochy.destroy
    respond_to do |format|
      format.html { redirect_to edds_prochies_url, notice: 'Запись успешно удалена.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_edds_prochy
      @edds_prochy = EddsProchie.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def edds_prochy_params
      params[:edds_prochie].permit(
        :date,:msg_time,:end_time,:address,:type_viezd,:sluzhby,:description
      )
    end
end
