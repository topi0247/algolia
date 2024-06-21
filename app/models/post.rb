class Post < ApplicationRecord
  belongs_to :user
  has_many :post_tags
  has_many :tags, through: :post_tags
  has_many :post_synalios
  has_many :synalios, through: :post_synalios
  has_many :post_game_systems
  # has_many :game_systems, through: :post_game_systems

  enum publish_state: { draft: 0, all_publish: 1, only_url: 2, only_follower: 3, private_publish:4 }

  include AlgoliaSearch

  algoliasearch do
    attribute :title, :caption, :publish_state, :published_at
    attribute :user do
      { id: user.id, name: user.name, uuid: user.uuid}
    end
    attribute :tags do
      tags.map { |tag| { id: tag.id, name: tag.name } }
    end
    attribute :synalios do
      synalios.map { |synalio| { id: synalio.id, name: synalio.name } }
    end
    attribute :post_game_systems do
      post_game_systems.map { |post_game_system| { name: GameSystem.find(post_game_system.game_system_id) } }
    end
    searchableAttributes ['title', 'caption']
    customRanking ['desc(published_at)']
  end
end
