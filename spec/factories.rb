FactoryBot.define do

  factory :user do
    email { "#{8.times do |val| (65 + rand(25)).chr end}}@hotmail.com" }
    password { '789456' }
  end

end
