class Station < ApplicationRecord
  belongs_to :bukken, optional: true
end
