class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :chats,dependent: :destroy
  has_one_attached :picture
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :birth_place
  belongs_to_active_hash :residence
  belongs_to_active_hash :blood_type
  belongs_to_active_hash :gender
end
