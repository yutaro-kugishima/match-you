class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :tweets
  has_many :comments
  has_one_attached :picture
  # has_one :birth_place

  # def self.search(search)
  #   if search != ""
  #     User.where('text LIKE(?)', "%#{search}%")
  #   else
  #     User.all
  #   end
  # end
end
