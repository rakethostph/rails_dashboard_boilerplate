class Profile < ApplicationRecord
	belongs_to :user
	# mount_uploader :profile_avatar, ProfileAvatarUploader
	enum gender: [:male, :female]
	mount_uploader :avatar, AvatarUploader
end
