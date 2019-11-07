class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_one :profile

  after_create :build_profile, dependent: :destroy

	
	
  def build_profile
	Profile.create(user: self) # Associations must be defined correctly for this syntax, avoids using ID's directly.
  end
end
