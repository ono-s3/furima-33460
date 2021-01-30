class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :birthday
    validates :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥]/ }
      # message: Full-width characters
    validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥]/ }
      # message: Full-width characters
  end

  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/ } do
    validates :last_name_kana
    # message: Full-width katakana characters
    validates :first_name_kana
    # message: Full-width katakana characters
  end

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  validates :password, format: { with: VALID_PASSWORD_REGEX}, length: { minimum: 6}

  # message: Password Include both letters and numbers
  has_many :items
  has_many :buys


end
