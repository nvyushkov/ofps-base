class IpvsController < ApplicationController
  before_action :set_ipv, only: [:show, :edit, :destroy]

  # GET /ipvs
  # GET /ipvs.json
  def index
    @ipvs = Ipv.all
  end

  # GET /ipvs/1
  # GET /ipvs/1.json
  def show
  end

  # GET /ipvs/new
  def new
    @ipv = Ipv.new(:fire_id => params[:fire_id])
  end

  # GET /ipvs/1/edit
  def edit
  end

  # POST /ipvs
  # POST /ipvs.json
  def create
    @ipv = Ipv.new(ipv_params)

    respond_to do |format|
      if @ipv.save
        format.html { redirect_to fire_path(:id => @ipv.fire_id, :fire_id => @ipv.fire_id), notice: 'ИПВ успешно добавлено.' }
        format.json { render :show, status: :created, location: fires_path }
      else
        format.html { render :new }
        format.json { render json: @ipv.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ipvs/1
  # PATCH/PUT /ipvs/1.json
  def update
    @ipv = Ipv.find(params[:id])

    respond_to do |format|
      if @ipv.update(ipv_params)
        format.html { redirect_to fire_path(:id => @ipv.fire_id, :fire_id => @ipv.fire_id), notice: 'Запись успешно обновлена.' }
        format.json { render :show, status: :ok, location: fires_path }
      else
        format.html { render :edit }
        format.json { render json: @ipv.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ipvs/1
  # DELETE /ipvs/1.json
  def destroy
    @ipv.destroy
    respond_to do |format|
      format.html { redirect_to fires_path, notice: 'ИПВ успешно удалено.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_ipv
    @ipv = Ipv.where( " fire_id = ?", params[:fire_id]).last
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def ipv_params
    params[:ipv].permit(
        :fire_id,:ac_not_water,:pg_magistral_line,:pv_magistral_line,
        :vodoem_magistral_line,:vnb_magistral_line,:vnutr_vodoem,:perekachka,
        :pg_podvoz,:pv_podvoz,:vodoem_podvoz,:vnb_podvoz,:neskolko,:do_pribytia
    )
  end
end
