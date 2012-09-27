class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :avatar, :name
  validates_presence_of :name

  has_many :posts
  has_and_belongs_to_many :roles

  default_scope order: 'created_at'

  def role?(role)
    return !!self.roles.find_by_name(role.to_s)
  end

  def admin?
    role? :admin
  end
end
