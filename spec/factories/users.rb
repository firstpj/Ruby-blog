# spec/factories/users.rb

FactoryBot.define do
  factory :user do
    name { 'Akorda' }
    photo_link { 'photo_url' }
    bio { 'Undisputed King of DIY' }
    posts_counter { 0 }
  end
end
