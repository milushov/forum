class Topic < ActiveRecord::Base
  attr_accessible :subject, :text

  belongs_to :board
  has_many :posts, dependent: :destroy

  default_scope order: 'created_at DESC'

  validates_presence_of :subject
  validates :subject, length: { in: 5..50 }
  validates :text, length: { maximum: 1000 }
end
