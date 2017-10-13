class Product < ActiveRecord::Base
	belongs_to :category
	belongs_to :subcategory
	has_many :order_products
	has_many :orders, through: :order_products
validates :name, presence: true,
length: { minimum: 5}


 has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end
