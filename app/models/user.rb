class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :carts
  has_many :orders
  belongs_to :current_cart, class_name: 'Cart', foreign_key: 'current_cart_id'
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
