

10.times do
  post = Post.create(title: Faker::Lorem.word, author: (Faker::Name.first_name + ' ' + Faker::Name.last_name), body: Faker::Lorem.paragraph(sentence_count = 12))
  tag = Tag.create(name: Faker::Lorem.word)
  Join.create(post_id: post.id, tag_id: tag.id)
end
