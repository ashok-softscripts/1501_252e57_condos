class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable :registerable :validatable :recoverable
  devise :database_authenticatable, :rememberable, :trackable

	attr_accessible :email, :password, :password_confirmation

end
