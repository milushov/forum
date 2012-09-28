class Post < ActiveRecord::Base
  attr_accessible :reply_to, :text

  belongs_to :topic
  belongs_to :user

  default_scope order: 'created_at'

  validates_presence_of :text
  validates :text, length: {in: 5..1000}
end
