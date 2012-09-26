class Topic < ActiveRecord::Base
  attr_accessible :subject

  belongs_to :board, foreign_key: 'board_id'

  default_scope order: 'created_at'
end
