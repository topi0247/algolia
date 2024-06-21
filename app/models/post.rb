class Post < ApplicationRecord
  belongs_to :user
  has_many :post_tags
  has_many :tags, through: :post_tags
  has_many :post_synalios
  has_many :synalios, through: :post_synalios
  has_many :post_game_systems
  has_many :game_systems, through: :post_game_systems

  enum publish_state: { draft: 0, all_publish: 1, only_url: 2, only_follower: 3, private_publish:4 }

  include AlgoliaSearch

  algoliasearch do
  end
end
