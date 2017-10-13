class Category < ApplicationRecord
has_many :products , dependent: :destroy
has_many :subcategory , dependent: :destroy
validates :name, presence: true,
length: { minimum: 5}

end
