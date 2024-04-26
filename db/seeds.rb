require 'faker'

# Crear 5 usuarios
5.times do
  user = User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: SecureRandom.alphanumeric(10)
  )

  # Crear al menos una publicación para cada usuario
  2.times do
    post = Post.create!(
      title: Faker::Lorem.sentence,
      content: Faker::Lorem.paragraph,
      user: user,
      answers_count: Faker::Number.between(from: 0, to: 5_000),
      likes_count: Faker::Number.between(from: 0, to: 10_000),
      published_at: Time.zone.now
    )
  end
end

# Crear 5 etiquetas
5.times do
  Tag.create!(
    name: Faker::Lorem.word
  )
end

# Asociar etiquetas a las publicaciones
Post.all.each do |post|
  rand(1..3).times do
    tag = Tag.all.sample
    post.tags << tag
  end
end
