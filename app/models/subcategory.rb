class Subcategory < ApplicationRecord

has_many :products , dependent: :destroy
belongs_to :category

validates :name, presence: true,
length: { minimum: 5}
end
