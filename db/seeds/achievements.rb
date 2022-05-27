Achievement.delete_all
def create_achievement(user)
  user.achievements.create!(title: Faker::JapaneseMedia::OnePiece.location, description: Faker::JapaneseMedia::OnePiece.quote)
end

User.find_each do |user|
  rand(1..5).times { create_achievement(user) }
end