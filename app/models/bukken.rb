class Bukken < ApplicationRecord
  #アソシエーション
  has_many :stations

  #バリデーション
   validates :name, presence: true
   validates :price, presence: true
   validates :address, presence: true
   validates :year, presence: true
   validates :note, presence: true
   

  #子要素も登録する
  accepts_nested_attributes_for :stations,allow_destroy: true

end
