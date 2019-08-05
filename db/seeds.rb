# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

connection = ActiveRecord::Base.connection

Country.delete_all
Serial.delete_all
Genre.delete_all
Actor.delete_all
Season.delete_all

sql = File.read('db/resources/restart_seq.sql')
restart_seq = sql.split(/;$/)
restart_seq.pop
ActiveRecord::Base.transaction do
  restart_seq.each do |seq|
    connection.execute(seq)
  end
end

File.open('db/resources/countries.txt') do |countries|
  countries.read.each_line do |country|
    country_name, shortcut = country.chomp.split(',')
    Country.create(country_name: country_name, shortcut: shortcut) unless country.blank?
  end
end

File.open('db/resources/genres.txt') do |genres|
  genres.read.each_line do |genre|
    genre_name = genre.chomp
    Genre.create(title: genre_name) unless genre_name.blank?
  end
end

File.open('db/resources/actors.txt') do |actors|
  actors.read.each_line do |actor|
    actor_fname, actor_lname = actor.chomp.split(',')
    Actor.create(first_name: actor_fname, last_name: actor_lname) unless actor.blank?
  end
end

sql = File.read('db/resources/serials.sql')
serials = sql.split(/;$/)
serials.pop
ActiveRecord::Base.transaction do
  serials.each do |serial|
    connection.execute(serial)
  end
end

Dir[File.join(Rails.root, 'db', 'resources', '*.rb')].sort.each do |seed|
  load seed
end
