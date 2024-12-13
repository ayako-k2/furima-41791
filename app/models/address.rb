class Address < ApplicationRecord
  belongs_to :purchase

   validates :postal_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
   validates :city, presence: {message: "can't be blank"}
   validates :address, presence: {message: "can't be blank"}
   validates :tel, presence: true, format: { with: /\A[0-9]{10,11}\z/, message: "is invalid. It should be 10 to 11 digits without hyphens." }

   require 'active_hash'
  extend ActiveHash::Associations::ActiveRecordExtensions
   belongs_to :prefecture

  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }, presence: true


end