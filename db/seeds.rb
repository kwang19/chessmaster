usernames = ["alice", "bob", "carol"]

usernames.each do |username|
  user = User.create
  user.username = username
  user.email = "#{username}@example.com"
  user.password = "12341234"
  user.save
end

puts "There are now #{User.count} users in the database."

game_infos = [
  {
    :pgn => "1. d4 d5 2. c4 c6 3. Nf3 Nf6 4. e3 Bf5 5. Nc3 e6 6. Nh4 Bg6 7. Nxg6 hxg6 8. Bd2 Nbd7 9. g3 Bb4 10. Bg2 dxc4 11. Qe2 Nb6 12. O-O Qe7 13. a3 Bd6 14. a4 a5 15. e4 e5 16. Be3 Nfd7 17. dxe5 Qxe5 18. f4 Qh5 19. Bf3 Qh3 20. Bg4 Qh6 21. h4 Bc5 22. Rad1 g5 23. fxg5 Qg6 24. Bxc5 Nxc5 25. Qe3 Nbd7 26. Bf5 Qh5 27. Qd4 Rd8 28. Qxg7 Nd3 29. g6 Rf8 30. e5 N7c5 31. gxf7+",
    :eventname => "Chicago Open 2014",
    :eventdate => "2014-05-26",
    :white => "Jack M.",
    :black => "Brian Smith",
    :result => "1-0",
    :user_id=>1
  },
  {
    :pgn => "1. d4 d5 2. c4 c6 3. Nf3 Nf6 4. e3 Bf5 5. Nc3 e6 6. Nh4 Bg6 7. Nxg6 hxg6 8. Bd2 Nbd7 9. g3 Bb4 10. Bg2 dxc4 11. Qe2 Nb6 12. O-O Qe7 13. a3 Bd6 14. a4 a5 15. e4 e5 16. Be3 Nfd7 17. dxe5 Qxe5 18. f4 Qh5 19. Bf3 Qh3 20. Bg4 Qh6 21. h4 Bc5 22. Rad1 g5 23. fxg5 Qg6 24. Bxc5 Nxc5 25. Qe3 Nbd7 26. Bf5 Qh5 27. Qd4 Rd8 28. Qxg7 Nd3 29. g6 Rf8 30. e5 N7c5 31. gxf7+",
    :eventname => "College Final Four 2016",
    :eventdate => "2016-12-26",
    :white => "Robson, R.",
    :black => "Jacobson, Aaron",
    :result => "1-0",
    :user_id=>2
  },
  {
    :pgn => "1. d4 d5 2. c4 c6 3. Nf3 Nf6 4. e3 Bf5 5. Nc3 e6 6. Nh4 Bg6 7. Nxg6 hxg6 8. Bd2 Nbd7 9. g3 Bb4 10. Bg2 dxc4 11. Qe2 Nb6 12. O-O Qe7 13. a3 Bd6 14. a4 a5 15. e4 e5 16. Be3 Nfd7 17. dxe5 Qxe5 18. f4 Qh5 19. Bf3 Qh3 20. Bg4 Qh6 21. h4 Bc5 22. Rad1 g5 23. fxg5 Qg6 24. Bxc5 Nxc5 25. Qe3 Nbd7 26. Bf5 Qh5 27. Qd4 Rd8 28. Qxg7 Nd3 29. g6 Rf8 30. e5 N7c5 31. gxf7+",
    :eventname => "9th Universidad Central",
    :eventdate => "2015-10-08",
    :white => "Nieto, M.",
    :black => "Argote Heredia, Valentina",
    :result => "1-0",
    :user_id=>1
  }
]

users = User.all

users.each do |user|
  game_infos.each do |game_info|
    game = Game.new(game_info)
    game.user_id = user.id
    game.save
  end
end

puts "There are now #{Game.count} Gamea in the database."

games = Game.all

games.each do |game|
  rand(6).times do
    comment = Comment.new
    comment.game_id = game.id
    comment.user_id = users.sample.id
    comment.body = Faker::Hacker.say_something_smart
    comment.save
  end
end

puts "There are now #{Comment.count} comments in the database."

games.each do |game|
  users.sample(rand(users.count)).each do |user|
    like = Like.new
    like.game_id = game.id
    like.user_id = user.id
    like.save
  end
end

puts "There are now #{Like.count} likes in the database."
