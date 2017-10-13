class User < ApplicationRecord
  has_many :orders
  has_many :cards
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

 after_create :assign_default_role



  def assign_default_role

    add_role(:user)
        # add_role(Role.find_by_name('user'))
  end


end
