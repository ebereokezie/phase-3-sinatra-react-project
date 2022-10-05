puts "🌱 Seeding spices..."

100.times do

  game = Game.create(
    title: Faker::Game.title,
    platform: Faker::Game.platform,
    price: rand(0..50)
  )

  rand(1..10).times do

    Review.create(
      score: rand(1..10),
      comment: Faker::Lorem.sentence,
      game_id: game.id

    )
  end
end
puts "✅ Done seeding!"
