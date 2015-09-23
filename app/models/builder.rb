class Builder < ActiveRecord::Base
	mount_uploader :image, ImageUploader
	
	searchkick

	has_many :reviews
	belongs_to :category

	validates :name, :address, :category_id, :phone, :website, :image, presence: true

	validates :phone, format: { with: /\A\(\d{3}\) \d{3}-\d{4}\z/,
    message: "must be in the format (123) 456-7890" }

    validates :website, format: { with: /\Ahttps?:\/\/.*\z/,
    message: "must start with http:// or https://" }

    validates :address, format: { with: /\A\d+[^,]+,[^,]+, [^,]+, \d{4}\z/,
    message: "must be in the format 350 Street Name, Suburb, City, 2060" }

end
