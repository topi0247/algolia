class PostGameSystem < ApplicationRecord
  belongs_to :post
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :game_system
end
