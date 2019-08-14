FactoryBot.define do
  factory :user do
    email { 'johndoe@hotmail.com' }
    password { '789456' }
  end

  factory :country do
    id { 1 }
    country_name { 'Argentina' }
    shortcut { 'AR' }
  end

  factory :serial do
    title { 'Serial title' }
    year_of_premiere { '2017' }
    description { 'Serial description' }
    country
  end

  factory :season do
    serial
  end

  factory :episode do
    season
    title { 'Episode title' }
    release_date { '2014-07-05' }
  end
end
