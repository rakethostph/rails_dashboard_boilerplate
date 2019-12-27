class User < ApplicationRecord
  rolify
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_one :profile, dependent: :destroy

  after_create :build_profile, dependent: :destroy
  # after_create :add_distributor_id

  after_create :assign_default_role
  
  # enum roles: [:client, :agent, :distributor, :admin,]

  def my_full_name
    "#{self.profile.first_name} #{self.profile.last_name}"
  end

  # validates :roles, :presence => :true

  def role_selection
    "#{name}"
  end

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

  # attr_accessor :set_current_user
  # def set_current_user
  #   current_user = User.find(current_user)
  # end

  # def get_current_user
  #   current_user
  # end

  # def add_distributor_id
  #   @profile = Profile.where(user: self)
  #   @profile.update_attribute(distributor_id: id)
  # end

  def build_profile
    Profile.create(user: self)
  end
end
