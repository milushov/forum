class Post < ActiveRecord::Base
  attr_accessible :reply_to, :text

  belongs_to :topic

  default_scope order: 'created_at'
end
