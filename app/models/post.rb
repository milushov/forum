class Post < ActiveRecord::Base
  attr_accessible :reply_to, :text
end
