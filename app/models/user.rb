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

  def my_full_name
    "#{self.profile.first_name} #{self.profile.last_name}"
  end

  # validates :roles, :presence => :true

  def users_role
    if self.has_role? :admin 
      "#{'Admin'}"
    elsif self.has_role? :distributor
     "#{'Distributor'}"
    elsif self.has_role? :agent
     "#{'Agent'}"
    else
     "#{'Client'}"
    end

  end

  def assign_default_role
    self.add_role(:client) if self.roles.blank?
  end

  def build_profile
    Profile.create(user: self, distributor_id: self)
  end
end
