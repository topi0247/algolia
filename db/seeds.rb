30.times do |n|
  User.find_or_create_by!(name: "user#{n + 1}")
end

10.times do |n|
  Synalio.find_or_create_by!(name: "synalio#{n + 1}")
end

20.times do |n|
  Tag.find_or_create_by!(name: "tag#{n + 1}")
end

40.times do |n|
  post = Post.find_or_create_by!(title: "post#{n + 1}", caption: "caption#{n + 1}", user: User.all.sample, publish_state: Post.publish_states.keys.sample, published_at: Time.current, postable_type: "Illust")
  rand = Random.rand(1..5)
  post.tags = Tag.all.sample(rand)
  rand = Random.rand(1..5)
  post.synalios = Synalio.all.sample(rand)
  game_systems = GameSystem.all.sample
  post.game_systems = game_systems
  psot.save!
end