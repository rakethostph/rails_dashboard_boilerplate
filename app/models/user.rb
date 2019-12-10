class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_one :profile, dependent: :destroy

  after_create :build_profile, dependent: :destroy

  after_create :assign_default_role
  
  enum roles: [:client, :agent, :distributor, :admin,]

  # validates :roles, :presence => :true

  def assign_default_role
    self.add_role(:client) if self.roles.blank?
  end

  def build_profile
	Profile.create(user: self)
  end
end
