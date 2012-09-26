class Board < ActiveRecord::Base
  attr_accessible :name

  has_many :topics, dependent: :destroy, foreign_key: 'board_id'

  default_scope order: 'created_at'
end
