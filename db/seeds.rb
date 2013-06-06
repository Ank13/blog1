

10.times do
  post = Post.create(title: Faker::Lorem.word, author: Faker::Name.name, body: Faker::Lorem.paragraph)
  tag = Tag.create(name: Faker::Lorem.word)
  Join.create(post_id: post.id, tag_id: tag.id)
end
