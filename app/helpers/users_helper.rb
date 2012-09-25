module UsersHelper
  def show_users users, options = {}
    count = options[:by] || 3

    new_users = []

    finish = (users.size-1)/count || 0

    0.upto(finish) do |n|
      a = n*count
      b = n*count+count
      new_users.push users[a...b]
    end

    new_users
  end
end
