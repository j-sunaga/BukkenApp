class Bukken < ApplicationRecord
  #アソシエーション
  has_many :stations

  #子要素も登録する
  accepts_nested_attributes_for :stations,allow_destroy: true

end
