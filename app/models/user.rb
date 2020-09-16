class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items

  validates :nickname, :email, :password, :fullname_first, :fullname_last, :kananame_first, :kananame_last, :birth, presence: true
  validates :kananame_first, :kananame_last, format: { with: /\A[ァ-ン]/, base: 'お名前(カナ)はカタカナで入力してください。' }
  validates :fullname_first, :fullname_last, format: { with: /\A[ぁ-んァ-ン一-龥]/, base: 'お名前は全角で入力してください。'}

  validates :password, format: {with: /\A[a-z\d]{8,100}+\z/i, message: 'password は 英数混合6文字以上です'}
end
