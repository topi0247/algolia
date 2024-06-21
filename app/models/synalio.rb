class Synalio < ApplicationRecord
  has_many :post_synalios
  has_many :posts, through: :post_synalios
end
