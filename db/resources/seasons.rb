# Game of Thrones
(1..8).each do |i|
  Season.create(id: "1#{i}", serial_id: '1')
end

# True Detective
(1..3).each do |i|
  Season.create(id: "2#{i}", serial_id: '2')
end

# The Walking Dead
(1..10).each do |i|
  Season.create(id: "3#{i}", serial_id: '3')
end

# The Big Bang Theory
(1..12).each do |i|
  Season.create(id: "4#{i}", serial_id: '4')
end

# Supernatural
(1..14).each do |i|
  Season.create(id: "5#{i}", serial_id: '5')
end

# House of Cards
(1..6).each do |i|
  Season.create(id: "6#{i}", serial_id: '6')
end

# American Horror Story
(1..8).each do |i|
  Season.create(id: "7#{i}", serial_id: '7')
end

# Rick and Morty
(1..3).each do |i|
  Season.create(id: "8#{i}", serial_id: '8')
end
