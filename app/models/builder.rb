class Builder < ActiveRecord::Base
	mount_uploader :image, ImageUploader
end
