class BukkensController < ApplicationController
  before_action :add_station, only: [:edit]
  before_action :set_bukken, only: [:show, :edit, :update, :destroy]

  def index
    @bukkens = Bukken.all
  end

  def show
    @stations_order = @bukken.stations.order('walk_time IS NULL, walk_time ASC')
  end

  def new
    @bukken = Bukken.new
    2.times{@bukken.stations.build}
  end

  def edit
  end

  def create
    @bukken = Bukken.new(bukken_params)
    if @bukken.save
      redirect_to bukkens_path, notice: "物件情報の登録が完了しました"
    else
      render action: :new
    end
  end

  def update
    if @bukken.update(bukken_params_edit)
      redirect_to bukken_path(@bukken.id), notice: '物件情報を更新しました'
    else
      render :edit
    end
  end

  def destroy
    @bukken.destroy
    redirect_to bukkens_path, notice: '物件情報を削除しました'
  end

  private

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
      #最寄り駅の登録数を3に制限
      if Bukken.find(params[:id]).stations.count <3
        Bukken.find(params[:id]).stations.create
      end
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
