
def create_user
  user = User.create(
    name:                Faker::JapaneseMedia::OnePiece.character,
    is_teacher:          rand(0..1).zero?,
    email:               Faker::Internet.email,
    password:            Faker::Internet.password
  )
  user.save!
end

5.times { create_user }