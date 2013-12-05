class User < ActiveRecord::Base
  has_and_belongs_to_many :networks
  has_and_belongs_to_many :groups
  has_many :shares

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
