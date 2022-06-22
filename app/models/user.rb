class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には半角英字と半角数字の両方を含めて設定してください' 

  with_options presence: true do
    validates :nickname
    validates :first_name,      format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'には全角文字を使用してください' }
    validates :last_name,       format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'には全角文字を使用してください' }
    validates :first_name_kana, format: { with: /\A[ァ-ヶー]+\z/, message: 'には全角カナ文字を使用してください' }
    validates :last_name_kana,  format: { with: /\A[ァ-ヶー]+\z/, message: 'には全角カナ文字を使用してください' }
    validates :birthday
  end

  has_many :items
  has_many :orders
  has_many :comments
  has_many :cards, dependent: :destroy
end
