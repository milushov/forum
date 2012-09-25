User.delete_all

count_of_users = 10
avatars = 1..9
pass = '123456'


User.create! do |user|
  user.email = 'roma@milushov.ru'
  user.password = pass
  user.password_confirmation = pass
  user.name = cur_user_name = 'roma'
  user.avatar = 'http://cs411618.userapi.com/u788157/a_976d41fa.jpg'
end

1.upto(count_of_users) do |i|
  cur_user_name = ''

  new_user = User.new do |user|
    user.email = "test_user_#{i}@milushov.ru"
    user.password = pass
    user.password_confirmation = pass
    user.name = cur_user_name = "Test User #{i}"
    user.avatar = "http://milushov.ru/#{rand(avatars)}.jpg"
  end
  
  if new_user.save!
    puts "#{cur_user_name} created!"
  else
    puts 'user not created :-('
  end
end
