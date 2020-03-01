require "csv"
#csvファイルを扱うためのgemを読み込む

CSV.foreach('db/bukken.csv') do |row|
#foreachは、ファイル（hoge.csv）の各行を引数として、ブロック(do~endまでを範囲とする『引数のかたまり』)を繰り返し実行する
#rowには、読み込まれた行が代入される
Bukken.create(:name=>row[0],:price=>row[1],:address=>row[2],:year=>row[3],:note=>row[4],stations_attributes:[:line=>row[5],:station_name=>row[6],:walk_time=>row[7]])

end
