class Product < ApplicationRecord
	mount_uploader :product_cover, ProductCoverUploader
	has_many :warranty
	resourcify
end
