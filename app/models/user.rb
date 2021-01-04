class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :tweets
  has_many :messages
  has_one_attached :picture
  # belongs_to :category
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :birth_place
  belongs_to_active_hash :residence
  belongs_to_active_hash :blood_type
  belongs_to_active_hash :gender

  # def self.search(search)
  #   if search != ""
  #     User.where('text LIKE(?)', "%#{search}%")
  #   else
  #     User.all
  #   end
  # end
end
