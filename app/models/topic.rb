class Topic < ActiveRecord::Base
  attr_accessible :subject

  belongs_to :board
  has_many :posts, dependent: :destroy

  default_scope order: 'created_at'
end
