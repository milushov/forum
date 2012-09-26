class Board < ActiveRecord::Base
  attr_accessible :name

  has_many :topics, dependent: :destroy

  default_scope order: 'created_at'
end
