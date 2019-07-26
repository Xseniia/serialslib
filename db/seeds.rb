# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Country.delete_all
Serial.delete_all

File.open('db/resources/countries.txt') do |countries|
  countries.read.each_line do |country|
    country_name, shortcut = country.chomp.split(',')
    Country.create(country_name: country_name, shortcut: shortcut) unless country_name.blank? || shortcut.blank?
  end
end

connection = ActiveRecord::Base.connection

sql = File.read('db/resources/serials.sql')
serials = sql.split(/;$/)
serials.pop

ActiveRecord::Base.transaction do
  serials.each do |serial|
    connection.execute(serial)
  end
end
