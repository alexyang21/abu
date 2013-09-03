class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :name, :email, :password, :password_confirmation,
                  :remember_me, :address, :city, :state, :zipcode, :phone

  validates_presence_of :name, :email, :password, :password_confirmation,
                        :address, :city, :state, :zipcode, :phone

  validates :city, format: { with: /[a-zA-Z\s]+/, message: "City can only contain letters and spaces" }

  validates :state, format: { with: /[a-zA-Z]{2}/, message: "State must contain two letters" }

  validates :zipcode, format: { with: /\d{5}/, message: "Zipcode must contain 5 digits" }

  validates :phone, format: { with: /\d{3}-\d{3}-\d{4}/, message: "Phone number must contain 9 or 10 digits" }

end
