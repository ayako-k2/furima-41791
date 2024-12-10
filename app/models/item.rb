class Item < ApplicationRecord

  has_one_attached :image

  require 'active_hash'
  extend ActiveHash::Associations::ActiveRecordExtensions
   belongs_to :category
  

  validates :category_id, :condition_id, :deliveryfee_id, :prefecture_id, :shipdate_id, numericality: { other_than: 1, message: "can't be blank" } 
end
