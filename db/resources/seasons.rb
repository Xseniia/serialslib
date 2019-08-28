# Game of Thrones
(1..8).each do |i|
  Season.create(serial_id: '1')
end

# True Detective
(1..3).each do |i|
  Season.create(serial_id: '2')
end

# The Walking Dead
(1..10).each do |i|
  Season.create(serial_id: '3')
end

# The Big Bang Theory
(1..12).each do |i|
  Season.create(serial_id: '4')
end

# Supernatural
(1..14).each do |i|
  Season.create(serial_id: '5')
end

# House of Cards
(1..6).each do |i|
  Season.create(serial_id: '6')
end

# American Horror Story
(1..8).each do |i|
  Season.create(serial_id: '7')
end

# Rick and Morty
(1..3).each do |i|
  Season.create(serial_id: '8')/
end

# Game of Thrones season 1
Episode.create(season_id: '1', title: 'Winter Is Coming', release_date: Date.new(2011, 4, 17))
Episode.create(season_id: '1', title: 'The Kingsroad', release_date: Date.new(2011, 4, 24))
Episode.create(season_id: '1', title: 'Lord Snow', release_date: Date.new(2011, 5, 1))
Episode.create(season_id: '1', title: 'Cripples, Bastards, and Broken Things', release_date: Date.new(2011, 5, 8))
Episode.create(season_id: '1', title: 'The Wolf and the Lion', release_date: Date.new(2011, 5, 15))
Episode.create(season_id: '1', title: 'A Golden Crown', release_date: Date.new(2011, 5, 22))
Episode.create(season_id: '1', title: 'You Win or You Die', release_date: Date.new(2011, 5, 29))
Episode.create(season_id: '1', title: 'The Pointy End', release_date: Date.new(2011, 6, 5))
Episode.create(season_id: '1', title: 'Baelor', release_date: Date.new(2011, 6, 12))
Episode.create(season_id: '1', title: 'Fire and Blood', release_date: Date.new(2011, 6, 19))
