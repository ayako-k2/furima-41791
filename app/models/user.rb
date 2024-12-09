class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, :lastname, :firstname, :lastname_kana, :firstname_kana, :birthday , presence: true

  with_options presence: true do
    # ひらがな、カタカナ、漢字のみ許可する
    validates :firstname, :lastname, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is invalid. Input full-width characters."}
    # カタカナのみ許可する
    validates :firstname_kana, :lastname_kana, format: {with: /\A[ァ-ヶー]+\z/, message: "is invalid. Input full-width katakana characters."}
    # 半角英字数字のみ許可する
    # validates :birthday, format: {with: /\A[a-z0-9]+\z/i, message: "is invalid. Input half-width characters."}
  end

end
