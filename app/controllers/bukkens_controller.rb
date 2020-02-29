class BukkensController < ApplicationController
  before_action :add_station, only: [:edit]
  before_action :set_bukken, only: [:show, :edit, :update, :destroy]

  def index
    @bukkens = Bukken.all
  end

  def show
  end

  def new
    @bukken = Bukken.new
    2.times{@bukken.stations.build}
  end

  def edit
  end

  def create
    @bukken = Bukken.new(bukken_params)

    respond_to do |format|
      if @bukken.save
        format.html { redirect_to @bukken, notice: '物件情報の登録が完了しました' }
        format.json { render :show, status: :created, location: @bukken }
      else
        format.html { render :new }
        format.json { render json: @bukken.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @bukken.update(bukken_params_edit)
        format.html { redirect_to @bukken, notice: '物件情報を更新しました' }
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
      format.html { redirect_to bukkens_url, notice: '物件情報を削除しました' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bukken
      @bukken = Bukken.find(params[:id])
    end

    #編集画面で新たに最寄り駅を登録できるようにするメソッド。
    #ブランクの最寄り駅がある場合は新たな最寄り駅の登録画面を非表示
    def add_station
      blank = false
      Bukken.find(params[:id]).stations.each do |station|
        if station[:line].blank? && station[:station_name].blank? && station[:walk_time].blank?
          blank = true
        end
      end
      unless blank
        Bukken.find(params[:id]).stations.create
      end
    end

    #update用のstrongparameter
    def bukken_params_edit
      params.require(:bukken).permit(:name, :price, :address, :year, :note,stations_attributes:[:line, :station_name, :walk_time,:bukken_id,:id,:_destroy])
    end

    #登録用のstrongparameter
    def bukken_params
      params.require(:bukken).permit(:name, :price, :address, :year, :note,stations_attributes:[:line, :station_name, :walk_time,:bukken_id,:_destroy])
    end

end
