class Item < ApplicationRecord


  has_one_attached :image
  validate :image_presence

  def image_presence
    unless image.attached?
     errors.add(:image, 'must be attached')
    end
  end

  validates :item_name, presence: {message:"can't be blank" }
  validates :description, presence: {message:"can't be blank" }
  validates :price, 
             presence: true,
             format: { with: /\A[0-9]+\z/, message: 'must be entered as a one-byte number and set within the range of ¥300 to ¥9,999,999.' }, 
             numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }

  require 'active_hash'
  extend ActiveHash::Associations::ActiveRecordExtensions
   belongs_to :category
   belongs_to :condition
   belongs_to :deliveryfee
   belongs_to :prefecture
   belongs_to :shipdate

  validates :category_id, :condition_id, :deliveryfee_id, :prefecture_id, :shipdate_id, numericality: { other_than: 1, message: "can't be blank" }, presence: true

  belongs_to :user

end



