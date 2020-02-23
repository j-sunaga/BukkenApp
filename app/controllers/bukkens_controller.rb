class BukkensController < ApplicationController
  before_action :set_bukken, only: [:show, :edit, :update, :destroy]

  # GET /bukkens
  # GET /bukkens.json
  def index
    @bukkens = Bukken.all
  end

  def show
  end

  def new
    @bukken = Bukken.new
    @bukken.stations.build
  end

  def edit
  end

  def create
    @bukken = Bukken.new(bukken_params)

    respond_to do |format|
      if @bukken.save
        format.html { redirect_to @bukken, notice: 'Bukken was successfully created.' }
        format.json { render :show, status: :created, location: @bukken }
      else
        format.html { render :new }
        format.json { render json: @bukken.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bukkens/1
  # PATCH/PUT /bukkens/1.json
  def update
    respond_to do |format|
      if @bukken.update(bukken_params)
        format.html { redirect_to @bukken, notice: 'Bukken was successfully updated.' }
        format.json { render :show, status: :ok, location: @bukken }
      else
        format.html { render :edit }
        format.json { render json: @bukken.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bukkens/1
  # DELETE /bukkens/1.json
  def destroy
    @bukken.destroy
    respond_to do |format|
      format.html { redirect_to bukkens_url, notice: 'Bukken was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bukken
      @bukken = Bukken.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bukken_params
      params.require(:bukken).permit(:name, :price, :address, :year, :note,stations_attributes:[:line, :station_name, :walk_time,:bukken_id,:_destroy])
    end
end
