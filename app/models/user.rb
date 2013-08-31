class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :name, :email, :password, :password_confirmation,
                  :remember_me, :address, :phone

  validates :name, presence: true
  validates :address, presence: true
  validates :phone, presence: true
  validates :phone, format: { with: / \d{9,10} /, message: "Phone number must contain 9 or 10 digits"}

end
