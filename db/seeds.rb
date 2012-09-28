#require 'pry'
User.delete_all

count_of_users = 10
avatars = 1..9
pass = '123456'

iam = User.create! do |user|
  user.email = 'roma@milushov.ru'
  user.password = pass
  user.password_confirmation = pass
  user.name = cur_user_name = 'roma'
  user.avatar = 'http://cs411618.userapi.com/u788157/a_976d41fa.jpg'
end

iam.roles.create!({name: 'admin'})

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
    puts new_user.errors
  end
end

Board.delete_all

boards_names = %w{
  ruby
  git
  coffee
  vim
  offtop
}

boards_names.each do |b_name|
  new_board = Board.new do |board|
    board.name = b_name
  end

  if new_board.save!
    puts "#{b_name} board created!"
  else
    puts 'board not created :-('
    puts new_board.errors
  end
end

$text = File.open("#{Rails.root}/db/Steve_Jobs.txt").read.to_s.split('. ')
count_of_topics = 3..23

Board.all.each do |board|
  rand(count_of_topics).times do
    new_topic = board.topics.new do |topic|
      topic.subject = $text[rand(0...$text.size)][0...50]
    end

    if new_topic.save!
      puts "#{new_topic.subject[0..15]} topic created!"
    else
      puts 'topic not created :-('
      puts new_topic.errors
    end
  end
end

def post_text count_sentence = 10
  text_for_post = ''

  rand(1..count_sentence).times do
    text_for_post += $text[rand(0...$text.size)]+'.'
  end

  text_for_post
end

users = User.limit 10
count_of_posts = 7..15
only_for_first_board = false

Board.limit( only_for_first_board ? 1 : 10 ).each do |board|
  board.topics.each do |topic|
    rand(count_of_posts).times do
      user = users[rand(0...users.size)]

      new_post = topic.posts.new do |post|
        post.text = post_text(15)[0...1000]
        post.user = user
      end

      if new_post.save!
        puts "#{new_post.text[0..15]} post created!"
      else
        puts 'post not created :-('
        puts new_post.errors
      end
    end
  end
end
